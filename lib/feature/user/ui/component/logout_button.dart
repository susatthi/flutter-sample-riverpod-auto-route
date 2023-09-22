import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../use_case/logout.dart';
import 'button_loading.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useCaseState = ref.watch(logoutUseCaseProvider);
    return useCaseState.isLoading
        ? const TextButton(
            onPressed: null,
            child: ButtonLoading(),
          )
        : TextButton(
            onPressed: () => ref.read(logoutUseCaseProvider.notifier).invoke(),
            child: const Text('ログアウト'),
          );
  }
}
