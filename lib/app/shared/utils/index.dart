export 'password.util.dart';

// validate phone number
bool validatePhoneNumber({required String phone}) {
  RegExp regex = RegExp(r"^\+?[0-9]{10,13}$");
  return regex.hasMatch(phone);
}
