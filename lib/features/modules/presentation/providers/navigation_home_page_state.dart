import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/detail/presentation/state/detail_sections_state.dart';

final pageIndexProvider = StateProvider<int>((ref) => 0);

final navigationServiceProvider = Provider<NavigationService>((ref) {
  return NavigationService(ref);
});

class NavigationService {
  final Ref _ref;

  NavigationService(this._ref);

  void navigateTo(int page) {
    _ref.read(pageControllerProvider).animateToPage(
          page,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
    _ref.read(pageIndexProvider.notifier).state = page;
  }

  void goBack() {
    navigateTo(0);
  }
}
