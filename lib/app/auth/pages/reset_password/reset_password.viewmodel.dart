import 'package:belljob/repositories.dart';

class ResetPasswordViewModel extends ViewModel {
  String? password;
  String? confirmPassword;

  void resetPassword() {
    void startResetPassword() {
      var loading = SweetDialog(
          context: context, dialogType: DialogType.loading.toString());
      loading.show();

      Future.delayed(const Duration(seconds: 2), () {
        loading.dismiss();
        SweetDialog(
          context: context,
          barrierDismissible: false,
          dialogType: DialogType.success.toString(),
          title: 'auth.dialog.password_changed.title'.tr,
          content: 'auth.dialog.password_changed.desc'.tr,
          confirmText: 'auth.understand'.tr,
          onConfirm: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        ).show();
        return;
      });
    }

    void checkPassword() {
      if (password == null) {
        SweetDialog(
          context: context,
          dialogType: DialogType.error.toString(),
          title: 'auth.dialog.empty_password.title'.tr,
          content: 'auth.dialog.empty_password.desc'.tr,
          confirmText: 'auth.understand'.tr,
        ).show();
        return;
      }

      if (confirmPassword == null) {
        SweetDialog(
          context: context,
          dialogType: DialogType.error.toString(),
          title: 'auth.dialog.empty_password_confirm.title'.tr,
          content: 'auth.dialog.empty_password_confirm.desc'.tr,
          confirmText: 'auth.understand'.tr,
        ).show();
        return;
      }

      if (password != confirmPassword) {
        SweetDialog(
          context: context,
          dialogType: DialogType.error.toString(),
          title: 'auth.dialog.password_not_match.title'.tr,
          content: 'auth.dialog.password_not_match.desc'.tr,
          confirmText: 'auth.understand'.tr,
        ).show();
        return;
      }

      PasswordCheck(password: password!).process(
        PasswordResult(
          onPasswordValid: startResetPassword,
          onPasswordInvalid: (message) {
            SweetDialog(
              context: context,
              dialogType: DialogType.error.toString(),
              title: 'auth.dialog.invalid_password.title'.tr,
              content: message,
              confirmText: 'auth.understand'.tr,
            ).show();
            return;
          },
        ),
      );
    }

    checkPassword();
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
