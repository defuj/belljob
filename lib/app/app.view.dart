import 'package:belljob/app/app.vm.dart';
import 'package:belljob/packages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM<AppViewModel>(
      view: () => const _AppView(),
      viewModel: AppViewModel(),
    );
  }
}

class _AppView extends StatelessView<AppViewModel> {
  // set reactive to true to make the view listen to the view model's changes.
  const _AppView({Key? key}) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    return Container();
  }
}
