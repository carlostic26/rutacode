import 'package:flutter_riverpod/flutter_riverpod.dart';

final startJrExamProvider = StateProvider<bool>((ref) => false);
final startMidExamProvider = StateProvider<bool>((ref) => false);
final startSrExamProvider = StateProvider<bool>((ref) => false);

final examProviderSelector =
    Provider.family<StateProvider<bool>, String>((ref, module) {
  switch (module.toLowerCase()) {
    case 'jr':
      return startJrExamProvider;
    case 'mid':
      return startMidExamProvider;
    case 'sr':
      return startSrExamProvider;
    default:
      return startJrExamProvider;
  }
});
