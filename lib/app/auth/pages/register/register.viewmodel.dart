import 'dart:developer';

import 'package:belljob/packages.dart';

class RegisterViewModel extends ViewModel {
  final box = GetStorage();
  String? profilePicturePath;
  String name = '';
  String phone = '';
  String password = '';
  String confirmPassword = '';
  String? accountType;

  void takePictureFace() async {
    await availableCameras()
        .then((value) => Get.to(TakePictureFace(cameras: value)));
  }

  void takePictureId() async {
    await availableCameras()
        .then((value) => Get.to(TakePictureId(cameras: value)));
  }

  void validate({required String accountType}) {
    this.accountType = accountType;
    if (name == '') {
      SweetDialog(
        context: context,
        dialogType: DialogType.error.toString(),
        title: 'Nama tidak boleh kosong',
        content:
            'Silahkan isi nama lengkap anda terlebih dahulu untuk melanjutkan',
        confirmText: 'Mengerti',
      ).show();
    } else if (phone == '') {
      SweetDialog(
        context: context,
        dialogType: DialogType.warning.toString(),
        title: 'Nomor telepon tidak boleh kosong',
        content: 'Silahkan isi nomor telepon anda terlebih dahulu',
        confirmText: 'Mengerti',
      ).show();
    } else if (password == '') {
      SweetDialog(
        context: context,
        dialogType: DialogType.warning.toString(),
        title: 'Kata sandi tidak boleh kosong',
        content: 'Silahkan isi kata sandi anda terlebih dahulu',
        confirmText: 'Mengerti',
      ).show();
    } else if (confirmPassword == '') {
      SweetDialog(
        context: context,
        dialogType: DialogType.warning.toString(),
        title: 'Konfirmasi kata sandi tidak boleh kosong',
        content: 'Silahkan isi konfirmasi kata sandi anda terlebih dahulu',
        confirmText: 'Mengerti',
      ).show();
    } else if (password != confirmPassword) {
      SweetDialog(
        context: context,
        dialogType: DialogType.warning.toString(),
        title: 'Konfirmasi kata sandi tidak sesuai',
        content: 'Silahkan isi konfirmasi kata sandi anda dengan benar',
        confirmText: 'Mengerti',
      ).show();
    } else {
      PasswordCheck(password: password).process(
        PasswordResult(
          onPasswordValid: () {},
          onPasswordInvalid: (message) {
            SweetDialog(
              context: context,
              title: 'Kata sandi tidak valid',
              content: message,
              confirmText: 'Mengerti',
            ).show();
          },
        ),
      );
    }
  }

  @override
  void init() {}

  @override
  void onDependenciesChange() {
    try {
      profilePicturePath = box.read('profilePicturePath');
      log('profilePicturePath: $profilePicturePath');
      notifyListeners();
      // ignore: empty_catches
    } catch (e) {}
  }

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
