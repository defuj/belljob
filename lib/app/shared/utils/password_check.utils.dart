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
      result.onPasswordInvalid('Kata sandi minimal 8 karakter');
    } else if (password!.length > 20) {
      result.onPasswordInvalid('Kata sandi maksimal 20 karakter');
    } else if (password!.contains(' ')) {
      result.onPasswordInvalid('Kata sandi tidak boleh mengandung spasi');
    } else if (!password!.contains(RegExp(r'[A-Z]'))) {
      result.onPasswordInvalid(
          'Kata sandi harus mengandung minimal 1 huruf besar');
    } else if (!password!.contains(RegExp(r'[a-z]'))) {
      result.onPasswordInvalid(
          'Kata sandi harus mengandung minimal 1 huruf kecil');
    } else if (!password!.contains(RegExp(r'[0-9]'))) {
      result.onPasswordInvalid('Kata sandi harus mengandung minimal 1 angka');
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
