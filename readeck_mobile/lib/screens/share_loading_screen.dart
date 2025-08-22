import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../services/sharing_service.dart';

class ShareLoadingScreen extends ConsumerWidget {
  const ShareLoadingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharingState = ref.watch(sharingServiceProvider);
    final isError = sharingState.error != null && sharingState.error!.isNotEmpty;
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
