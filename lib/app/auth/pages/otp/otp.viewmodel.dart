import 'dart:async';
import 'dart:developer';

import 'package:belljob/repositories.dart';

class OtpViewModel extends ViewModel {
  final String? nextPage;
  String? code;
  bool resend = true;
  int timer = 30;
  final String? phoneNumber;
  OtpViewModel({required this.phoneNumber, required this.nextPage});

  void checkCode() {
    if (code == null) {
      SweetDialog(
        context: context,
        dialogType: DialogType.warning.toString(),
        title: 'auth.dialog.empty_verification_code.title'.tr,
        content: 'auth.dialog.empty_verification_code.desc'.tr,
        confirmText: 'auth.understand'.tr,
      ).show();
      return;
    }

    if (code!.length != 6) {
      log('code $code, length: ${code!.length}');
      SweetDialog(
        context: context,
        dialogType: DialogType.warning.toString(),
        title: 'auth.dialog.invalid_verification_code.title'.tr,
        content: 'auth.dialog.invalid_verification_code.desc'.tr,
        confirmText: 'auth.understand'.tr,
      ).show();
      return;
    }

    var loading = SweetDialog(
        context: context, dialogType: DialogType.loading.toString());
    loading.show();

    Future.delayed(const Duration(seconds: 3), () {
      loading.dismiss();
      Get.offNamed(nextPage!);
    });
  }

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
