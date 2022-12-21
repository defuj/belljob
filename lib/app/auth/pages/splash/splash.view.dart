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
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Neang ',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: IColors.secondary50,
                        fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: 'Gawe',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: IColors.neutral20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
