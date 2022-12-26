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
    'label.choose_job_type'.tr,
    'job.type.builder'.tr,
    'job.type.driver'.tr,
    'job.type.cook'.tr,
    'job.type.carpenter'.tr,
    'job.type.gardener'.tr,
    'job.type.electrician'.tr,
    'job.type.plumber'.tr,
    'job.type.mechanic'.tr,
  ];
  String job = 'label.choose_job_type'.tr;

  List<String> genderList = [
    'label.gender.male'.tr,
    'label.gender.female'.tr,
  ];

  int genderNum = 0;
  String gender = 'label.gender.male'.tr;

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
          title: 'dialog.no_profile_picture.title'.tr,
          content: 'dialog.no_profile_picture.desc'.tr,
          confirmText: 'action.understand'.tr,
        ).show();

        return;
      }

      if (address == null || address == '') {
        SweetDialog(
          context: context,
          dialogType: DialogType.error.toString(),
          title: 'dialog.no_address.title'.tr,
          content: 'dialog.no_address.title'.tr,
          confirmText: 'action.understand'.tr,
        ).show();

        return;
      }

      if (job == 'label.choose_job_type'.tr) {
        SweetDialog(
          context: context,
          dialogType: DialogType.error.toString(),
          title: 'dialog.no_job_type.title'.tr,
          content: 'dialog.no_job_type.desc'.tr,
          confirmText: 'action.understand'.tr,
        ).show();

        return;
      }
    }

    if (name == '') {
      SweetDialog(
        context: context,
        dialogType: DialogType.error.toString(),
        title: 'dialog.empty_name.title'.tr,
        content: 'dialog.empty_name.desc'.tr,
        confirmText: 'action.understand'.tr,
      ).show();

      return;
    }

    if (phone == '') {
      SweetDialog(
        context: context,
        dialogType: DialogType.warning.toString(),
        title: 'dialog.empty_phone.title'.tr,
        content: 'dialog.empty_phone.desc'.tr,
        confirmText: 'action.understand'.tr,
      ).show();
      return;
    } else {
      if (!validatePhoneNumber(phone: phone)) {
        SweetDialog(
          context: context,
          dialogType: DialogType.warning.toString(),
          title: 'dialoh.invalid_phone.title'.tr,
          content: 'dialog.invalid_phone.desc'.tr,
          confirmText: 'action.understand'.tr,
        ).show();
        return;
      }
    }

    if (password == '') {
      SweetDialog(
        context: context,
        dialogType: DialogType.warning.toString(),
        title: 'dialog.empty_password.title'.tr,
        content: 'dialog.empty_password.desc'.tr,
        confirmText: 'action.understand'.tr,
      ).show();
      return;
    }

    if (confirmPassword == '') {
      SweetDialog(
        context: context,
        dialogType: DialogType.warning.toString(),
        title: 'dialog.empty_password_confirm.title'.tr,
        content: 'dialog.empty_password_confirm.desc'.tr,
        confirmText: 'action.understand'.tr,
      ).show();
      return;
    }

    if (password != confirmPassword) {
      SweetDialog(
        context: context,
        dialogType: DialogType.warning.toString(),
        title: 'dialog.password_not_match.title'.tr,
        content: 'dialog.password_not_match.desc'.tr,
        confirmText: 'action.understand'.tr,
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
            title: 'dialog.invalid_password.title'.tr,
            content: message,
            confirmText: 'action.understand'.tr,
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
