import 'package:belljob/packages.dart';

class SplashViewModel extends ViewModel {
  // Path: lib/app/splash/splash.viewmodel.dart
  // Compare this snippet from lib/app/splash/splash.view.dart:
  // import 'package:belljob/packages.dart';
  //
  // class Splash extends StatelessWidget {
  //   const Splash({super.key});
  //
  //   @override
  //   Widget build(BuildContext context) {
  //     return MVVM<>(
  // 	  view: () => const _SplashView(),
  // 	  viewModel: SplashViewModel(),
  // 	);
  //   }
  // }
  SplashViewModel() {
    // Path: lib/app/splash/splash.viewmodel.dart
    // Compare this snippet from lib/app/splash/splash.view.dart:
    // import 'package:belljob/packages.dart';
    //
    // class Splash extends StatelessWidget {
    //   const Splash({super.key});
    //
    //   @override
    //   Widget build(BuildContext context) {
    //     return MVVM<>(
    // 	  view: () => const _SplashView(),
    // 	  viewModel: SplashViewModel(),
    // 	);
    //   }
    // }
    Future.delayed(const Duration(seconds: 2), () {
      // Path: lib/app/splash/splash.viewmodel.dart
      // Compare this snippet from lib/app/splash/splash.view.dart:
      // import 'package:belljob/packages.dart';
      //
      // class Splash extends StatelessWidget {
      //   const Splash({super.key});
      //
      //   @override
      //   Widget build(BuildContext context) {
      //     return MVVM<>(
      // 	  view: () => const _SplashView(),
      // 	  viewModel: SplashViewModel(),
      // 	);
      //   }
      // }
      Navigator.pushReplacementNamed(context, '/main');
    });
  }
}
