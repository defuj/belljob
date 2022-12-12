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
    return const Scaffold();
  }
}
