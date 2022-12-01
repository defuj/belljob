import 'package:belljob/app/splash/index.dart';
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
    return Container();
  }
}
