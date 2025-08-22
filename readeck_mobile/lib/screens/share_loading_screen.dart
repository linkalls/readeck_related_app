import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../services/sharing_service.dart';

class ShareLoadingScreen extends ConsumerStatefulWidget {
  final String sharedText;
  const ShareLoadingScreen({super.key, required this.sharedText});

  @override
  ConsumerState<ShareLoadingScreen> createState() => _ShareLoadingScreenState();
}

class _ShareLoadingScreenState extends ConsumerState<ShareLoadingScreen> {
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_started) {
      // ローディング画面を確実に表示してから保存処理を開始（短縮）
      Future.delayed(const Duration(milliseconds: 200), () {
        if (mounted) {
          ref
              .read(sharingServiceProvider.notifier)
              .handleInitialSharedText(widget.sharedText);
        }
      });
      _started = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sharingState = ref.watch(sharingServiceProvider);
    final isError =
        sharingState.error != null && sharingState.error!.isNotEmpty;
    final isDone = !sharingState.isProcessing && !isError;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: isError
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 48),
                  const SizedBox(height: 16),
                  Text(
                    sharingState.error!,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('閉じる'),
                  ),
                ],
              )
            : isDone
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 48),
                  const SizedBox(height: 16),
                  const Text('保存完了', style: TextStyle(fontSize: 18)),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LoadingAnimationWidget.fourRotatingDots(
                    color: Theme.of(context).primaryColor,
                    size: 64,
                  ),
                  const SizedBox(height: 24),
                  const Text('保存中...', style: TextStyle(fontSize: 18)),
                ],
              ),
      ),
    );
  }
}
