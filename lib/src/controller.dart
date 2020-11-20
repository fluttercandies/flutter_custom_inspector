///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 11/18/20 5:51 PM
///
import 'package:flutter/foundation.dart';

class InspectorController {
  const InspectorController._();

  static final ValueNotifier<bool> isEnabled = ValueNotifier<bool>(false);

  static void turn(bool shouldEnable) {
    if (shouldEnable == null || shouldEnable == isEnabled.value) {
      return;
    }
    isEnabled.value = shouldEnable;
  }
}
