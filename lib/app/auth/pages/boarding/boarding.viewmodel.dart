import 'dart:developer';

import 'package:belljob/repositories.dart';

class BoardingViewModel extends ViewModel {
  var panelController = PanelController();
  final box = GetStorage();

  String? _lang = Get.deviceLocale?.languageCode;
  String? get lang => _lang;
  set lang(String? value) {
    _lang = value;
    Get.updateLocale(Locale(value!));
    notifyListeners();
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
  Future<void> init() async {
    // box.listenKey('lang', (value) {
    //   lang = value;
    // });
    log('Bahasa : ${Get.deviceLocale?.languageCode}');
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
