import 'package:belljob/packages.dart';

class FindAccountViewModel extends ViewModel {
  final String? nextPage;
  final String? action;
  String? phoneNumber;
  final String? title;
  final String? accountType;

  FindAccountViewModel({
    required this.nextPage,
    required this.action,
    required this.title,
    required this.accountType,
  });

  void sendVerification() {
    if (phoneNumber == null) {
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
    if (validatePhoneNumber(phone: phoneNumber!)) {
      var loading = SweetDialog(
          context: context,
          dialogType: DialogType.loading.toString(),
          barrierDismissible: false);
      loading.show();

      Future.delayed(const Duration(seconds: 3), () {
        loading.dismiss();
        // SweetDialog(
        //   context: context,
        //   barrierDismissible: false,
        //   dialogType: DialogType.success.toString(),
        //   title: 'Kode verifikasi berhasil dikirim',
        //   content: 'Silahkan cek SMS untuk melanjutkan',
        //   confirmText: 'Mengerti',
        //   onConfirm: () => Get.off(Otp(phoneNumber: phoneNumber)),
        // ).show();
        //Get.offNamed(nextPage!, arguments: phoneNumber)
        Get.off(Otp(phoneNumber: phoneNumber, nextPage: nextPage));
      });
    } else {
      SweetDialog(
        context: context,
        dialogType: DialogType.warning.toString(),
        title: 'Nomor handphone tidak valid',
        content: 'Silahkan masukkan nomor handphone yang valid',
        confirmText: 'Mengerti',
      ).show();
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
