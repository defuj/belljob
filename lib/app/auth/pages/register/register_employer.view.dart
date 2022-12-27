import 'package:belljob/repositories.dart';

class RegisterEmployer extends StatelessWidget {
  const RegisterEmployer({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM<RegisterViewModel>(
      view: () => const _RegisterView(),
      viewModel: RegisterViewModel(),
    );
  }
}

class _RegisterView extends StatelessView<RegisterViewModel> {
  const _RegisterView({key}) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'auth.register.title'.tr,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'auth.register.title'.tr,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: IColors.neutral20, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'auth.register.desc'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: IColors.neutral20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 4),
                child: Text(
                  'auth.form.label.full_name'.tr,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: IColors.neutral10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                ),
              ),
              InputText(
                hintText: 'auth.form.hint.full_name'.tr,
                onChanged: (value) => viewModel.name = value,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 4),
                child: Text(
                  'auth.form.label.phone'.tr,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: IColors.neutral10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                ),
              ),
              InputPhoneNumber(
                hintText: 'auth.form.hint.phone'.tr,
                onChanged: (value) => viewModel.phone = '+62$value',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 4),
                child: Text(
                  'auth.form.label.password'.tr,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: IColors.neutral10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                ),
              ),
              InputPassword(
                hintText: 'auth.form.hint.password'.tr,
                onChanged: (value) => viewModel.password = value,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 4),
                child: Text(
                  'auth.form.label.password_confirmation'.tr,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: IColors.neutral10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                ),
              ),
              InputPassword(
                hintText: 'auth.form.hint.password_confirmation'.tr,
                onChanged: (value) => viewModel.confirmPassword = value,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 16),
                child: ButtonPrimary(
                  text: 'auth.register'.tr,
                  onPressed: () => viewModel.validate(
                    accountType: AccountType.employer.toString(),
                  ),
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'auth.have_account?'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: IColors.neutral10),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context).pop(),
                        text: 'auth.login'.tr,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: IColors.secondary50,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
