import 'package:get/get.dart';

class PasswordResult {
  final Function() onPasswordValid;
  final Function(String) onPasswordInvalid;
  PasswordResult({
    required this.onPasswordValid,
    required this.onPasswordInvalid,
  });
}

class PasswordCheck {
  String? password;
  PasswordCheck({required this.password});

  void process(PasswordResult result) {
    if (password!.length < 8) {
      result.onPasswordInvalid('label.password_min_length'.tr);
    } else if (password!.length > 20) {
      result.onPasswordInvalid('label.password_max_length'.tr);
    } else if (password!.contains(' ')) {
      result.onPasswordInvalid('label.password_no_space'.tr);
    } else if (!password!.contains(RegExp(r'[A-Z]'))) {
      result.onPasswordInvalid('label.password_capital_letter'.tr);
    } else if (!password!.contains(RegExp(r'[a-z]'))) {
      result.onPasswordInvalid('label.password_lowercase_letter'.tr);
    } else if (!password!.contains(RegExp(r'[0-9]'))) {
      result.onPasswordInvalid('label.password_number'.tr);
    } else {
      result.onPasswordValid();
    }
  }

  static bool check(String password) {
    if (password.length < 8) {
      return false;
    }
    if (password.length > 20) {
      return false;
    }
    if (password.contains(' ')) {
      return false;
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return false;
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      return false;
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return false;
    }
    return true;
  }
}

// validate password at least 8 characters
bool validatePassword({required String password}) {
  RegExp regex = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
  return regex.hasMatch(password);
}
