import 'package:belljob/packages.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BoardingViewModel extends ViewModel {
  var panelController = PanelController();

  String? _loginType; // worker or employer
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
