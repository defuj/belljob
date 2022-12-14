import 'package:belljob/packages.dart';

class LoginViewModel extends ViewModel {
  String? password;
  String? phone;
  String? loginType;

  void login({required String loginType}) {
    this.loginType = loginType;
    if (phone == null || phone!.isEmpty) {
      Fluttertoast.showToast(
        msg: "Nomor telepon tidak boleh kosong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );
      return;
    }

    if (password == null || password!.isEmpty) {
      Fluttertoast.showToast(
        msg: "Password tidak boleh kosong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );
      return;
    }

    PasswordCheck(password: password).process(
      PasswordResult(
        onPasswordValid: () {},
        onPasswordInvalid: (String message) {
          Fluttertoast.showToast(
            msg: message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 14.0,
          );
        },
      ),
    );
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
