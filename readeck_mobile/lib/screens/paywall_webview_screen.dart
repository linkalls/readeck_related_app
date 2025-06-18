import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:markdown/markdown.dart' as md;
import 'package:webview_flutter/webview_flutter.dart';

import '../utils/api_client.dart';

class PaywallWebViewScreen extends ConsumerStatefulWidget {
  final String url;
  final String? title;
  final VoidCallback? onBookmarkSaved;

  const PaywallWebViewScreen({
    super.key,
    required this.url,
    this.title,
    this.onBookmarkSaved,
  });

  @override
  ConsumerState<PaywallWebViewScreen> createState() =>
      _PaywallWebViewScreenState();
}

class _PaywallWebViewScreenState extends ConsumerState<PaywallWebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _isSaving = false;
  bool _paywallResolved = false;
  String? _error;
  String? _fullHtmlContent;
  Map<String, dynamic>? _extractedMetadata;
  List<String>? _prefetchResources;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  void _initializeWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(
        'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36',
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
              _error = null;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
            if (_paywallResolved) {
              _extractContentFromPage();
            }
          },
          onWebResourceError: (WebResourceError error) {
            print(
              'WebView Error: ${error.description} - Type: ${error.errorType}',
            );
            setState(() {
              _error = 'Failed to load page: ${error.description}';
              _isLoading = false;
            });
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      );

    _controller.loadRequest(Uri.parse(widget.url));
  }

  Future<void> _extractContentFromPage() async {
    try {
      final String bodyScript = '''
        (function() {
          var main = document.querySelector('main');
          var article = document.querySelector('article');
          var content = main || article || document.body;
          return content.innerHTML;
        })();
      ''';

      final result = await _controller.runJavaScriptReturningResult(bodyScript);
      String bodyHtml = result.toString();

      if (bodyHtml.startsWith('"') && bodyHtml.endsWith('"')) {
        bodyHtml = bodyHtml.substring(1, bodyHtml.length - 1);
        bodyHtml = bodyHtml.replaceAll(r'\"', '"');
        bodyHtml = bodyHtml.replaceAll(r'\\n', '\n');
      }

      // Markdown経由でクリーン化
      final markdown = html2md.convert(bodyHtml);
      final cleanHtml = md.markdownToHtml(markdown);

      setState(() {
        _fullHtmlContent = cleanHtml;
      });

      if (cleanHtml.isEmpty) {
        _showErrorSnackBar('本文が抽出できませんでした');
      } else {
        _showSuccessSnackBar(
          '本文をMarkdown経由でクリーン化しました (${cleanHtml.length} chars)',
        );
      }
    } catch (e) {
      setState(() {
        _fullHtmlContent = null;
      });
      _showErrorSnackBar('本文抽出に失敗: $e');
    }
  }

  Future<void> _saveToReadeck() async {
    if (_fullHtmlContent == null || _fullHtmlContent!.isEmpty) {
      _showErrorSnackBar('No HTML content extracted from the page');
      return;
    }
    setState(() {
      _isSaving = true;
    });
    try {
      final api = await getApiClient();
      final String finalTitle =
          _extractedMetadata?['title'] ??
          _extractedMetadata?['actualTitle'] ??
          widget.title ??
          'WebView Content';
      await api.createBookmarkWithContent(
        url: widget.url,
        title: finalTitle,
        contentHtml: _fullHtmlContent!,
        labels: ['paywall', 'webview'],
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Bookmark with full HTML content saved successfully'),
            backgroundColor: Colors.green,
          ),
        );
        widget.onBookmarkSaved?.call();
      }
    } catch (e) {
      print('Error saving to Readeck: $e');
      if (mounted) {
        _showErrorSnackBar('Failed to save bookmark: $e');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  void _showErrorSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
    }
  }

  void _showSuccessSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.green),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'WebView'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(_paywallResolved ? Icons.check_circle : Icons.lock_open),
            onPressed: () {
              setState(() {
                _paywallResolved = !_paywallResolved;
              });

              if (_paywallResolved) {
                _showSuccessSnackBar(
                  'Paywall marked as resolved! Content will be extracted.',
                );
                _extractContentFromPage();
              } else {
                _showErrorSnackBar('Paywall marked as unresolved');
              }
            },
            tooltip: _paywallResolved
                ? 'Paywall Resolved ✅'
                : 'Mark Paywall as Resolved 🔓',
          ),
        ],
      ),
      body: Stack(
        children: [
          if (_error != null)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, size: 64, color: Colors.red),
                  SizedBox(height: 16),
                  Text(
                    _error!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _error = null;
                      });
                      _controller.reload();
                    },
                    child: Text('Retry'),
                  ),
                ],
              ),
            )
          else
            WebViewWidget(controller: _controller),

          if (_isLoading)
            Container(
              color: Colors.black54,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton:
          _paywallResolved &&
              _fullHtmlContent != null &&
              _fullHtmlContent!.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: _isSaving ? null : _saveToReadeck,
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              icon: _isSaving
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Icon(Icons.save),
              label: Text(_isSaving ? 'Saving...' : 'Save Article'),
            )
          : null,
    );
  }
}
