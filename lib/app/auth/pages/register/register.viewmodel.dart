import 'package:belljob/app/auth/pages/register/verify_id.view.dart';
import 'package:belljob/repositories.dart';

class RegisterViewModel extends ViewModel {
  final box = GetStorage();
  String? profilePicturePath;
  String? idPicturePath;
  String name = '';
  String phone = '';
  String password = '';
  String confirmPassword = '';
  String? accountType;
  String? address = '';
  List<String> jobList = [
    'auth.data.choose_job_type'.tr,
    'auth.data.job.builder'.tr,
    'auth.data.job.driver'.tr,
    'auth.data.job.cook'.tr,
    'auth.data.job.carpenter'.tr,
    'auth.data.job.gardener'.tr,
    'auth.data.job.electrician'.tr,
    'auth.data.job.plumber'.tr,
    'auth.data.job.mechanic'.tr,
  ];
  String job = 'auth.data.choose_job_type'.tr;

  List<String> genderList = [
    'auth.data.gender.male'.tr,
    'auth.data.gender.female'.tr,
  ];

  int genderNum = 0;
  String gender = 'auth.data.gender.male'.tr;

  void updateGender(int number) {
    genderNum = number;
    gender = genderList[number];
    notifyListeners();
  }

  void updateJob(String value) {
    job = value;
    notifyListeners();
  }

  void takePictureFace({String pathName = 'pathName'}) async {
    await availableCameras().then(
        (value) => Get.to(TakePictureFace(cameras: value, pathName: pathName)));
  }

  void takePictureId({String pathName = 'pathName'}) async {
    await availableCameras().then(
        (value) => Get.to(TakePictureId(cameras: value, pathName: pathName)));
  }

  void validate({required String accountType}) {
    this.accountType = accountType;
    // requirement for worker
    if (accountType == AccountType.worker.toString()) {
      if (profilePicturePath == null) {
        SweetDialog(
          context: context,
          dialogType: DialogType.error.toString(),
          title: 'auth.dialog.no_profile_picture.title'.tr,
          content: 'auth.dialog.no_profile_picture.desc'.tr,
          confirmText: 'auth.understand'.tr,
        ).show();

        return;
      }

      if (address == null || address == '') {
        SweetDialog(
          context: context,
          dialogType: DialogType.error.toString(),
          title: 'auth.dialog.no_address.title'.tr,
          content: 'auth.dialog.no_address.title'.tr,
          confirmText: 'auth.understand'.tr,
        ).show();

        return;
      }

      if (job == 'auth.data.choose_job_type'.tr) {
        SweetDialog(
          context: context,
          dialogType: DialogType.error.toString(),
          title: 'auth.dialog.no_job_type.title'.tr,
          content: 'auth.dialog.no_job_type.desc'.tr,
          confirmText: 'auth.understand'.tr,
        ).show();

        return;
      }
    }

    if (name == '') {
      SweetDialog(
        context: context,
        dialogType: DialogType.error.toString(),
        title: 'auth.dialog.empty_name.title'.tr,
        content: 'auth.dialog.empty_name.desc'.tr,
        confirmText: 'auth.understand'.tr,
      ).show();

      return;
    }

    if (phone == '') {
      SweetDialog(
        context: context,
        dialogType: DialogType.warning.toString(),
        title: 'auth.dialog.empty_phone.title'.tr,
        content: 'auth.dialog.empty_phone.desc'.tr,
        confirmText: 'auth.understand'.tr,
      ).show();
      return;
    } else {
      if (!validatePhoneNumber(phone: phone)) {
        SweetDialog(
          context: context,
          dialogType: DialogType.warning.toString(),
          title: 'dialoh.invalid_phone.title'.tr,
          content: 'auth.dialog.invalid_phone.desc'.tr,
          confirmText: 'auth.understand'.tr,
        ).show();
        return;
      }
    }

    if (password == '') {
      SweetDialog(
        context: context,
        dialogType: DialogType.warning.toString(),
        title: 'auth.dialog.empty_password.title'.tr,
        content: 'auth.dialog.empty_password.desc'.tr,
        confirmText: 'auth.understand'.tr,
      ).show();
      return;
    }

    if (confirmPassword == '') {
      SweetDialog(
        context: context,
        dialogType: DialogType.warning.toString(),
        title: 'auth.dialog.empty_password_confirm.title'.tr,
        content: 'auth.dialog.empty_password_confirm.desc'.tr,
        confirmText: 'auth.understand'.tr,
      ).show();
      return;
    }

    if (password != confirmPassword) {
      SweetDialog(
        context: context,
        dialogType: DialogType.warning.toString(),
        title: 'auth.dialog.password_not_match.title'.tr,
        content: 'auth.dialog.password_not_match.desc'.tr,
        confirmText: 'auth.understand'.tr,
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
            title: 'auth.dialog.invalid_password.title'.tr,
            content: message,
            confirmText: 'auth.understand'.tr,
          ).show();
        },
      ),
    );
  }

  void createAccount() async {
    if (accountType == AccountType.worker.toString()) {
      box.write(
        'register',
        RegisterWorkerModel(
          name: name,
          address: address,
          gender: gender,
          job: job,
          phone: phone,
          password: password,
          profilePicturePath: profilePicturePath,
        ).toJson(),
      );
    }

    var loading = SweetDialog(
      context: context,
      dialogType: DialogType.loading.toString(),
      barrierDismissible: false,
    );
    loading.show();

    Future.delayed(const Duration(seconds: 3), () async {
      loading.dismiss();
      Get.off(const VerifyID());
    });
  }

  void resetPicture({String pathName = 'pathName'}) {
    box.remove(pathName);
    notifyListeners();

    takePictureFace(pathName: pathName);
  }

  @override
  void init() {
    box.listenKey('profilePicturePath', (value) {
      if (value != null) {
        profilePicturePath = value;
        notifyListeners();
      }
    });

    box.listenKey('idPicturePath', (value) {
      if (value != null) {
        idPicturePath = value;
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
