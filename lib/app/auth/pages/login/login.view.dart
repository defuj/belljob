import 'package:belljob/packages.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM<LoginViewModel>(
      view: () => const _LoginView(),
      viewModel: LoginViewModel(),
    );
  }
}

class _LoginView extends StatelessView<LoginViewModel> {
  const _LoginView({key}) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    return const Scaffold();
  }
}
