import 'dart:async';

import 'package:belljob/packages.dart';

class OtpViewModel extends ViewModel {
  bool resend = true;
  int timer = 30;
  final String? phoneNumber;
  OtpViewModel({required this.phoneNumber});

  void startTimer() {
    if (resend) {
      resend = false;
      timer = 30;
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (this.timer > 0) {
          this.timer--;
          notifyListeners();
        } else {
          timer.cancel();
          resend = true;
          notifyListeners();
        }
      });
    }
  }

  @override
  void init() {}

  @override
  void onDependenciesChange() {}

  @override
  void onBuild() {
    startTimer();
  }

  @override
  void onMount() {}

  @override
  void onUnmount() {}

  @override
  void onResume() {}

  @override
  void onPause() {}

  @override
  void onInactive() {}

  @override
  void onDetach() {}
}
