import 'package:belljob/repositories.dart';

class LoginViewModel extends ViewModel {
  String? password;
  String? phone;
  String? loginType;

  void login({required String loginType}) {
    this.loginType = loginType;

    void checkAccount() {
      var loading = SweetDialog(
        context: context,
        dialogType: DialogType.loading.toString(),
        barrierDismissible: false,
      );
      loading.show();

      // timeout for testing
      Future.delayed(const Duration(seconds: 3), () {
        loading.dismiss();
        SweetDialog(
          context: context,
          dialogType: DialogType.success.toString(),
          title: 'dialog.login_success.title'.tr,
          content: 'dialog.login_success.desc'.tr,
          confirmText: 'action.next'.tr,
        ).show();
      });
    }

    void validate() {
      if (phone == null || phone!.isEmpty) {
        SweetDialog(
          context: context,
          dialogType: DialogType.warning.toString(),
          title: 'dialog.empty_phone.title'.tr,
          content: 'dialog.empty_phone.desc'.tr,
          confirmText: 'action.understand'.tr,
        ).show();
        return;
      }

      if (!validatePhoneNumber(phone: phone!)) {
        SweetDialog(
          context: context,
          dialogType: DialogType.warning.toString(),
          title: 'dialog.invalid_phone.title'.tr,
          content: 'dialog.invalid_phone.desc'.tr,
          confirmText: 'action.understand'.tr,
        ).show();
        return;
      }

      if (password == null || password!.isEmpty) {
        SweetDialog(
          context: context,
          dialogType: DialogType.warning.toString(),
          title: 'dialog.empty_password.title'.tr,
          content: 'dialog.empty_password.desc'.tr,
          confirmText: 'action.understand'.tr,
        ).show();
        return;
      }

      PasswordCheck(password: password).process(
        PasswordResult(
          onPasswordValid: checkAccount,
          onPasswordInvalid: (String message) {
            SweetDialog(
              context: context,
              dialogType: DialogType.error.toString(),
              title: 'dialog.invalid_password.title'.tr,
              content: message,
              confirmText: 'action.understand'.tr,
            ).show();
          },
        ),
      );
    }

    validate();
  }

  void forgotPassword() {
    Get.to(FindAccount(
      nextPage: '/reset_password',
      title: 'label.forgot_password'.tr,
      accountType: loginType,
      action: OtpAction.forgotPassword.toString(),
    ));
  }

  @override
  void init() {}

  @override
  void onDependenciesChange() {}

  @override
  void onBuild() {}

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
