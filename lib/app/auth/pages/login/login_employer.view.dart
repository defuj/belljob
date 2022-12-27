import 'package:belljob/repositories.dart';

class LoginEmployer extends StatelessWidget {
  const LoginEmployer({super.key});

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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      height: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 32),
              height: 4,
              width: 48,
              decoration: const BoxDecoration(
                color: IColors.neutral20,
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
            ),
          ),
          Text(
            'auth.login.label.welcome'.tr,
            style: Theme.of(context).textTheme.headline2!.copyWith(
                color: IColors.neutral20, fontWeight: FontWeight.w600),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              'auth.login.label.employer'.tr,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: IColors.neutral10),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 32),
            child: Text(
              'form.label.phone'.tr,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: IColors.neutral10,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          InputPhoneNumber(
            hintText: 'form.hint.phone'.tr,
            onChanged: (value) => viewModel.phone = '+62$value',
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Text(
              'form.label.password'.tr,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: IColors.neutral10, fontWeight: FontWeight.w500),
            ),
          ),
          InputPassword(
            hintText: 'form.hint.password'.tr,
            onChanged: (value) => viewModel.password = value,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(top: 16),
              child: InkWell(
                onTap: viewModel.forgotPassword,
                child: Text(
                  'action.forgot_password'.tr,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: IColors.secondary50, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 35, bottom: 7),
            child: ButtonPrimary(
              text: 'action.employer.login'.tr,
              onPressed: () => viewModel.login(
                loginType: AccountType.employer.toString(),
              ),
            ),
          ),
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'label.dont_have_account'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: IColors.neutral10),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.toNamed('/register_employer'),
                    text: 'action.register'.tr,
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
    );
  }
}
