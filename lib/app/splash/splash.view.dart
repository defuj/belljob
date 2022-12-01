import 'package:belljob/app/splash/splash.viewmodel.dart';
import 'package:belljob/packages.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM<SplashViewModel>(
      view: () => const _SplashView(),
      viewModel: SplashViewModel(),
    );
  }
}

class _SplashView extends StatelessView<SplashViewModel> {
  const _SplashView({key}) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    // create a splash screen with Scafold
    return Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
