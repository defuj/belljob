import 'package:belljob/packages.dart';

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
          title: 'Login berhasil',
          content: 'Selamat datang di Belljob',
          confirmText: 'Lanjutkan',
        ).show();
      });
    }

    void validate() {
      if (phone == null || phone!.isEmpty) {
        SweetDialog(
          context: context,
          dialogType: DialogType.warning.toString(),
          title: 'Nomor handphone tidak boleh kosong',
          content:
              'Silahkan isi nomor handphone anda terlebih dahulu untuk melanjutkan',
          confirmText: 'Mengerti',
        ).show();
        return;
      }

      if (!validatePhoneNumber(phone: phone!)) {
        SweetDialog(
          context: context,
          dialogType: DialogType.warning.toString(),
          title: 'Nomor handphone tidak valid',
          content:
              'Silahkan isi nomor handphone anda dengan benar untuk melanjutkan',
          confirmText: 'Mengerti',
        ).show();
        return;
      }

      if (password == null || password!.isEmpty) {
        SweetDialog(
          context: context,
          dialogType: DialogType.warning.toString(),
          title: 'Kata sandi tidak boleh kosong',
          content: 'Silahkan isi kata sandi anda terlebih dahulu',
          confirmText: 'Mengerti',
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
              title: 'Password tidak valid',
              content: message,
              confirmText: 'Mengerti',
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
      title: 'Lupa Kata Sandi',
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
