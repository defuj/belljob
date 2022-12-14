import 'package:belljob/packages.dart';

class RegisterViewModel extends ViewModel {
  String name = '';
  String phone = '';
  String password = '';
  String confirmPassword = '';
  String? accountType;

  void validate({required String accountType}) {
    this.accountType = accountType;
    if (name == '') {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => MyAlertDialog(
          context: context,
          title: 'Nama tidak boleh kosong',
          content: 'Silahkan isi nama anda terlebih dahulu',
          confirmText: 'Mengerti',
        ),
      );
    } else if (phone == '') {
      showDialog(
        context: context,
        builder: (BuildContext context) => MyAlertDialog(
          context: context,
          title: 'Nomor telepon tidak boleh kosong',
          content: 'Silahkan isi nomor telepon anda terlebih dahulu',
          confirmText: 'Mengerti',
        ),
      );
    } else if (password == '') {
      showDialog(
        context: context,
        builder: (BuildContext context) => MyAlertDialog(
          context: context,
          title: 'Kata sandi tidak boleh kosong',
          content: 'Silahkan isi kata sandi anda terlebih dahulu',
          confirmText: 'Mengerti',
        ),
      );
    } else if (confirmPassword == '') {
      showDialog(
        context: context,
        builder: (BuildContext context) => MyAlertDialog(
          context: context,
          title: 'Konfirmasi kata sandi tidak boleh kosong',
          content: 'Silahkan isi konfirmasi kata sandi anda terlebih dahulu',
          confirmText: 'Mengerti',
        ),
      );
    } else if (password != confirmPassword) {
      showDialog(
        context: context,
        builder: (BuildContext context) => MyAlertDialog(
          context: context,
          title: 'Konfirmasi kata sandi tidak sesuai',
          content: 'Silahkan isi konfirmasi kata sandi anda dengan benar',
          confirmText: 'Mengerti',
        ),
      );
    } else {
      PasswordCheck(password: password).process(
        PasswordResult(
          onPasswordValid: () {},
          onPasswordInvalid: (message) {
            showDialog(
              context: context,
              builder: (BuildContext context) => MyAlertDialog(
                context: context,
                title: 'Kata sandi tidak valid',
                content: message,
                confirmText: 'Mengerti',
              ),
            );
          },
        ),
      );
    }
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
