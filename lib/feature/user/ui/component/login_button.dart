import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../use_case/login.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useCaseState = ref.watch(loginUseCaseProvider);

    return useCaseState.isLoading
        ? const FilledButton(
            onPressed: null,
            child: SizedBox.square(
              dimension: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
              ),
            ),
          )
        : FilledButton(
            onPressed: () => ref.read(loginUseCaseProvider.notifier).invoke(),
            child: const Text('ログイン'),
          );
  }
}
