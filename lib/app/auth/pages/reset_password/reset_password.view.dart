import 'package:belljob/repositories.dart';

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
    return Scaffold(
      appBar: appBar(context: context),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'auth.form.label.new_password'.tr,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: IColors.neutral20, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'auth.safe_your_account'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: IColors.neutral20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48, bottom: 4),
              child: Text(
                'auth.form.label.new_password'.tr,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: IColors.neutral10,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
              ),
            ),
            InputPassword(
              hintText: 'auth.form.hint.new_password'.tr,
              onChanged: (value) => viewModel.password = value,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 4),
              child: Text(
                'auth.form.label.new_password_confirmation'.tr,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: IColors.neutral10,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
              ),
            ),
            InputPassword(
              hintText: 'auth.form.hint.new_password_confirmation'.tr,
              onChanged: (value) => viewModel.confirmPassword = value,
            ),
            Container(
              padding: const EdgeInsets.only(top: 24, bottom: 24),
              child: ButtonPrimary(
                text: 'auth.change_password'.tr,
                onPressed: viewModel.resetPassword,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
