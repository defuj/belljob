import 'package:belljob/app/app.vm.dart';
import 'package:belljob/packages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM<AppVm>(
      view: (_, __) => const _AppView(),
      viewModel: AppVm(),
    );
  }
}

class _AppView extends StatelessView<AppVm> {
  const _AppView({Key? key}) : super(key: key);

  @override
  Widget render(context, vm) {
    return Container();
  }
}
