import 'package:belljob/packages.dart';

class Boarding extends StatelessWidget {
  const Boarding({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM<BoardingViewModel>(
      view: () => const _BoardingView(),
      viewModel: BoardingViewModel(),
    );
  }
}

class _BoardingView extends StatelessView<BoardingViewModel> {
  const _BoardingView({key}) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Boarding Screen',
              style: Theme.of(context).textTheme.headline3,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () => viewModel.onGoToHome(),
                child: const Text('Go to Home'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
