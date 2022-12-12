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
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(
            image: AssetImage('assets/images/belljob.logo.png'),
            width: 135,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Image(
              image: AssetImage('assets/images/belljob.text.png'),
              width: 135,
            ),
          ),
        ],
      )),
    );
  }
}
