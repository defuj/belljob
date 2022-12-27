import 'dart:developer';

import 'package:belljob/repositories.dart';

class BoardingViewModel extends ViewModel {
  var panelController = PanelController();
  final box = GetStorage();

  String? _language = Get.locale!.languageCode;
  String? get language => _language;
  set language(String? value) {
    _language = value;
    Get.updateLocale(Locale(value!));
    notifyListeners();

    log('Language Current : ${Get.locale?.languageCode}');
  }

  String? _loginType;
  String? get loginType => _loginType;
  set loginType(String? value) {
    _loginType = value;
    notifyListeners();

    panelController.open();
  }

  void onGoToHome() {
    Get.offNamed('/main');
  }

  @override
  void init() {
    log('Language Current : ${Get.locale?.languageCode}');
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
