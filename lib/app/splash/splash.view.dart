import 'package:belljob/repositories.dart';

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
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 56),
              child: Image.asset(
                'assets/images/worker.jpg',
              ),
            ),
            const AppNameText(),
          ],
        ),
      ),
    );
  }
}
