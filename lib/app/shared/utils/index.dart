export 'password_check.utils.dart';

// validate phone number
bool validatePhoneNumber({required String phone}) {
  RegExp regex = RegExp(r"^\+?[0-9]{10,13}$");
  return regex.hasMatch(phone);
}

// validate password at least 8 characters
bool validatePassword({required String password}) {
  RegExp regex = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
  return regex.hasMatch(password);
}
