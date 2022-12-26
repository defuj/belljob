import 'package:belljob/repositories.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM<ForgotPasswordViewModel>(
      view: () => const _ForgotPasswordView(),
      viewModel: ForgotPasswordViewModel(),
    );
  }
}

class _ForgotPasswordView extends StatelessView<ForgotPasswordViewModel> {
  const _ForgotPasswordView({key}) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    return const Scaffold();
  }
}
