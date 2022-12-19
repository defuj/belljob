import 'package:belljob/packages.dart';

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
          title: 'Kata sandi berhasil diubah',
          content: 'Silahkan masuk kembali',
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
          title: 'Kata sandi belum diisi',
          content: 'Silahkan masukkan kata sandi baru',
          confirmText: 'Mengerti',
        ).show();
        return;
      }

      if (confirmPassword == null) {
        SweetDialog(
          context: context,
          dialogType: DialogType.error.toString(),
          title: 'Konfirmasi kata sandi belum diisi',
          content: 'Silahkan masukkan konfirmasi kata sandi baru',
          confirmText: 'Mengerti',
        ).show();
        return;
      }

      if (password != confirmPassword) {
        SweetDialog(
          context: context,
          dialogType: DialogType.error.toString(),
          title: 'Konfirmasi kata sandi tidak sesuai',
          content: 'Silahkan masukkan konfirmasi kata sandi yang sama',
          confirmText: 'Mengerti',
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
              title: 'Kata sandi tidak valid',
              content: message,
              confirmText: 'Mengerti',
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
