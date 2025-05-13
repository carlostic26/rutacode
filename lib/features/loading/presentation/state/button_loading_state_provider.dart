import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonStateNotifier extends StateNotifier<bool> {
  ButtonStateNotifier() : super(false);

  void enableButton() {
    state = true;
  }
}

final buttonState = StateNotifierProvider<ButtonStateNotifier, bool>((ref) {
  return ButtonStateNotifier();
});
