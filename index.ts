import { Command } from 'commander';
import FormData from 'form-data';
import { JSDOM } from 'jsdom';
import puppeteer from 'puppeteer';

// PageObjの型定義（エクステンションと同じ構造）
interface PageObj {
  url: string;
  title: string;
  metadata: Record<string, any>;
  headers: Record<string, string>;
  content: string;
  labels: string[];
  fromSelection: boolean;
  prefetch: string[];
}

// メタデータ抽出関数
function extractMetadata(document: Document): Record<string, any> {
  const metadata: Record<string, any> = {};

  // タイトル取得
  const titleEl = document.querySelector('title');
  if (titleEl) metadata.title = titleEl.textContent?.trim();

  // メタタグから情報抽出
  const metaTags = document.querySelectorAll('meta');
  metaTags.forEach(meta => {
    const property = meta.getAttribute('property') || meta.getAttribute('name');
    const content = meta.getAttribute('content');
    if (property && content) {
      metadata[property] = content;
    }
  });

  return metadata;
}

// プリフェッチリソース収集
function collectPrefetchResources(document: Document): string[] {
  const prefetch: string[] = [];

  // アイコンリンク収集 [1](#1-0) 
  const links = document.querySelectorAll('link');
  links.forEach(link => {
    const href = link.getAttribute('href');
    const rel = link.getAttribute('rel');
    const type = link.getAttribute('type');

    if (href) {
      if (rel && /icon/i.test(rel)) {
        prefetch.push(href);
      }
      if (type === 'application/json+oembed') {
        prefetch.push(href);
      }
    }
  });

  return prefetch;
}

// ページ取得関数
async function getPage(url: string): Promise<PageObj> {
  const browser = await puppeteer.launch({ headless: true });
  const page = await browser.newPage();

  try {
    // ページを読み込み
    await page.goto(url, { waitUntil: 'networkidle2' });

    // 遅延読み込み画像を強制読み込み [2](#1-1) 
    await page.evaluate(() => {
      const images = Array.from(document.images);
      return Promise.all(images.map(img => {
        if (img.loading === 'lazy') {
          img.loading = 'eager';
        }
        return new Promise((resolve) => {
          if (img.complete) {
            resolve(true);
          } else {
            img.onload = img.onerror = () => resolve(true);
          }
        });
      }));
    });

    // HTMLコンテンツ取得
    const htmlContent = await page.content();
    const dom = new JSDOM(htmlContent);
    const document = dom.window.document;

    // メタデータ抽出
    const metadata = extractMetadata(document);

    // プリフェッチリソース収集
    const prefetch = collectPrefetchResources(document);

    const pageObj: PageObj = {
      url: url,
      title: metadata.title || document.title || '',
      metadata,
      headers: { 'content-type': 'text/html; charset=utf-8' },
      content: htmlContent,
      labels: [],
      fromSelection: false,
      prefetch
    };

    return pageObj;

  } finally {
    await browser.close();
  }
}

// リソース取得関数
async function fetchResource(url: string, baseUrl: string): Promise<{ url: string; headers: Record<string, string>; body: Buffer; status: number }> {
  // urlが絶対URLでなければbaseUrlと結合
  let absoluteUrl: string;
  try {
    absoluteUrl = new URL(url, baseUrl).toString();
  } catch {
    absoluteUrl = url; // 念のため
  }
  const response = await fetch(absoluteUrl);
  const headers: Record<string, string> = {};
  response.headers.forEach((value, key) => {
    headers[key] = value;
  });
  const body = Buffer.from(await response.arrayBuffer());
  return {
    url: response.url,
    headers,
    body,
    status: response.status
  };
}

// API送信関数 [3](#1-2) 
async function savePage(pageObj: PageObj, serverUrl: string, token: string): Promise<any> {
  const form = new FormData();

  // 基本情報追加
  form.append('url', pageObj.url);
  form.append('title', pageObj.title);

  if (pageObj.fromSelection) {
    form.append('feature_find_main', 'false');
  }

  // ラベル追加
  if (Array.isArray(pageObj.labels)) {
    pageObj.labels.forEach(label => {
      form.append('labels', label);
    });
  }

  // メインリソース追加（プリフェッチに含まれていない場合）
  if (!pageObj.prefetch.includes(pageObj.url)) {
    const resourceBlob = Buffer.from([
      JSON.stringify({ url: pageObj.url, headers: pageObj.headers }),
      '\n',
      pageObj.content
    ].join(''));

    form.append('resource', resourceBlob);
  }

  // プリフェッチリソース並行取得・追加
  await Promise.all(
    pageObj.prefetch.map(async (resourceUrl) => {
      try {
        const resource = await fetchResource(resourceUrl, pageObj.url);

        // 2xx レスポンスのみ保持
        if (Math.floor(resource.status / 100) === 2) {
          const resourceBlob = Buffer.from([
            JSON.stringify({ url: resource.url, headers: resource.headers }),
            '\n',
            resource.body
          ].join(''));

          form.append('resource', resourceBlob);
        }
      } catch (error) {
        console.error(`Failed to fetch resource ${resourceUrl}:`, error);
      }
    })
  );

  // ReadeckのAPIエンドポイントに送信
  const response = await fetch(`${serverUrl}/api/bookmarks`, {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${token}`,
      ...form.getHeaders()
    },
    body: form.getBuffer()
  });

  const result = await response.json();

  return {
    ok: response.ok,
    status: response.status,
    headers: Object.fromEntries(response.headers.entries()),
    json: result,
    error: response.ok ? null : result.message || 'Unknown error'
  };
}

// CLI設定
const program = new Command();

program
  .name('readeck-cli')
  .description('Save web pages to Readeck')
  .version('1.0.0')
  .requiredOption('-u, --url <url>', 'URL to save')
  .requiredOption('-s, --server <server>', 'Readeck server URL')
  .requiredOption('-t, --token <token>', 'Authentication token')
  .option('-l, --labels <labels>', 'Comma-separated labels', '')
  .option('--title <title>', 'Custom title')
  .action(async (options) => {
    try {
      console.log('Fetching page content...');
      const pageObj = await getPage(options.url);

      // カスタムタイトルとラベル設定
      if (options.title) {
        pageObj.title = options.title;
      }
      if (options.labels) {
        pageObj.labels = options.labels.split(',').map((l: string) => l.trim());
      }

      console.log('Saving to Readeck...');
      const result = await savePage(pageObj, options.server, options.token);

      if (result.ok) {
        console.log('✅ Successfully saved to Readeck!');
        console.log(`Bookmark ID: ${result.headers['bookmark-id']}`);
      } else {
        console.error('❌ Failed to save:', result.error);
        process.exit(1);
      }
    } catch (error) {
      console.error('❌ Error:', error);
      process.exit(1);
    }
  });

program.parse();