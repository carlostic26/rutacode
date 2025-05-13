import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/level/presentation/state/confeti_shown_state_notifier.dart';

final confettiShownProvider =
    StateNotifierProvider<ConfettiShownNotifier, List<int>>(
  (ref) => ConfettiShownNotifier(),
);
