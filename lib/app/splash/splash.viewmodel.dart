import 'package:belljob/repositories.dart';

class SplashViewModel extends ViewModel {
  @override
  void init() {
    Future.delayed(const Duration(seconds: 3), () {
      //   Navigator.pushReplacementNamed(context, '/main');
      Get.offNamed('/boarding');
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
