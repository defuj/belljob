import 'package:belljob/repositories.dart';

class HomeViewModel extends ViewModel {
  PageController _pageController = PageController();
  PageController get pageController => _pageController;
  set pageController(PageController value) {
    _pageController = value;
    notifyListeners();
  }

  String _page = 'home.data.home'.tr;
  String get page => _page;
  set page(String value) {
    _page = value;
    notifyListeners();
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
