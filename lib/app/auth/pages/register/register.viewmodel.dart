import 'package:belljob/packages.dart';

class RegisterViewModel extends ViewModel {
  final box = GetStorage();
  String? profilePicturePath;
  String name = '';
  String phone = '';
  String password = '';
  String confirmPassword = '';
  String? accountType;
  String? address = '';
  List<String> jobList = [
    'Pilih jenis pekerjaan',
    'Baby Sitter',
    'Tukang Kebun',
    'Tukang Cuci',
    'Tukang Masak',
    'Tukang Jemur',
    'Tukang Ojek',
  ];
  String job = 'Pilih jenis pekerjaan';

  List<String> genderList = [
    'Laki-Laki',
    'Perempuan',
  ];

  int genderNum = 1;
  String gender = 'Laki-Laki';

  void updateGender(int number) {
    genderNum = number;
    gender = genderList[number];
    notifyListeners();
  }

  void updateJob(String value) {
    job = value;
    notifyListeners();
  }

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
    // requirement for worker
    if (accountType == AccountType.worker.toString()) {
      if (profilePicturePath == null) {
        SweetDialog(
          context: context,
          dialogType: DialogType.error.toString(),
          title: 'Belum ada foto profil',
          content:
              'Silahkan ambil foto profil terlebih dahulu untuk melanjutkan',
          confirmText: 'Mengerti',
        ).show();

        return;
      }

      if (address == null || address == '') {
        SweetDialog(
          context: context,
          dialogType: DialogType.error.toString(),
          title: 'Belum ada alamat',
          content: 'Silahkan isi alamat terlebih dahulu untuk melanjutkan',
          confirmText: 'Mengerti',
        ).show();

        return;
      }

      if (job == 'Pilih jenis pekerjaan') {
        SweetDialog(
          context: context,
          dialogType: DialogType.error.toString(),
          title: 'Belum memilih jenis pekerjaan',
          content:
              'Silahkan pilih jenis pekerjaan terlebih dahulu untuk melanjutkan',
          confirmText: 'Mengerti',
        ).show();

        return;
      }
    }

    if (name == '') {
      SweetDialog(
        context: context,
        dialogType: DialogType.error.toString(),
        title: 'Nama tidak boleh kosong',
        content:
            'Silahkan isi nama lengkap anda terlebih dahulu untuk melanjutkan',
        confirmText: 'Mengerti',
      ).show();

      return;
    }

    if (phone == '') {
      SweetDialog(
        context: context,
        dialogType: DialogType.warning.toString(),
        title: 'Nomor telepon tidak boleh kosong',
        content: 'Silahkan isi nomor telepon anda terlebih dahulu',
        confirmText: 'Mengerti',
      ).show();
      return;
    } else {
      if (!validatePhoneNumber(phone: phone)) {
        SweetDialog(
          context: context,
          dialogType: DialogType.warning.toString(),
          title: 'Nomor telepon tidak valid',
          content: 'Silahkan isi nomor telepon anda dengan benar',
          confirmText: 'Mengerti',
        ).show();
        return;
      }
    }

    if (password == '') {
      SweetDialog(
        context: context,
        dialogType: DialogType.warning.toString(),
        title: 'Kata sandi tidak boleh kosong',
        content: 'Silahkan isi kata sandi anda terlebih dahulu',
        confirmText: 'Mengerti',
      ).show();
      return;
    }

    if (confirmPassword == '') {
      SweetDialog(
        context: context,
        dialogType: DialogType.warning.toString(),
        title: 'Konfirmasi kata sandi tidak boleh kosong',
        content: 'Silahkan isi konfirmasi kata sandi anda terlebih dahulu',
        confirmText: 'Mengerti',
      ).show();
      return;
    }

    if (password != confirmPassword) {
      SweetDialog(
        context: context,
        dialogType: DialogType.warning.toString(),
        title: 'Konfirmasi kata sandi tidak sesuai',
        content: 'Silahkan isi konfirmasi kata sandi anda dengan benar',
        confirmText: 'Mengerti',
      ).show();
      return;
    }

    PasswordCheck(password: password).process(
      PasswordResult(
        onPasswordValid: createAccount,
        onPasswordInvalid: (message) {
          SweetDialog(
            dialogType: DialogType.error.toString(),
            context: context,
            title: 'Kata sandi tidak valid',
            content: message,
            confirmText: 'Mengerti',
          ).show();
        },
      ),
    );
  }

  void createAccount() async {
    var loading = SweetDialog(
      context: context,
      dialogType: DialogType.loading.toString(),
      barrierDismissible: false,
    );
    loading.show();

    Future.delayed(const Duration(seconds: 3), () async {
      loading.dismiss();
      SweetDialog(
        context: context,
        dialogType: DialogType.success.toString(),
        title: 'Akun berhasil dibuat',
        content: 'Silahkan login untuk melanjutkan',
        confirmText: 'Mengerti',
        barrierDismissible: false,
        onConfirm: () => Get.back(),
      ).show();
    });
  }

  void resetPicture() {
    box.remove('profilePicturePath');
    notifyListeners();

    takePictureFace();
  }

  @override
  void init() {
    box.listenKey('profilePicturePath', (value) {
      if (value != null) {
        profilePicturePath = value;
        notifyListeners();
      }
    });
  }

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
