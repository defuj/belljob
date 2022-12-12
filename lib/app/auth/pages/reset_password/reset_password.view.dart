import 'package:belljob/packages.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM<ResetPasswordViewModel>(
      view: () => const _ResetPasswordView(),
      viewModel: ResetPasswordViewModel(),
    );
  }
}

class _ResetPasswordView extends StatelessView<ResetPasswordViewModel> {
  const _ResetPasswordView({key}) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    return const Scaffold();
  }
}
