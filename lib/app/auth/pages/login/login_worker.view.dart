import 'package:belljob/packages.dart';

class LoginWorker extends StatelessWidget {
  const LoginWorker({super.key});

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
    return Form(
      child: Container(
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
              'Selamat datang kembali',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: IColors.neutral20, fontWeight: FontWeight.w600),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                'Raih penghasilan tambahan bersama Bell Job',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: IColors.neutral10),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32),
              child: Text(
                'Nomor Handphone',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: IColors.neutral10,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            InputPhoneNumber(
              onChanged: (value) => viewModel.phone = '+62$value',
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Text(
                'Kata Sandi',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: IColors.neutral10, fontWeight: FontWeight.w500),
              ),
            ),
            InputPassword(
              onChanged: (value) => viewModel.password = value,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => {},
                child: Text(
                  'Lupa kata sandi?',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: IColors.secondary50, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 35, bottom: 7),
              child: ButtonPrimary(
                text: 'Masuk sebagai Perkerja',
                onPressed: () =>
                    viewModel.login(loginType: AccountType.worker.toString()),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Belum punya akun?',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: IColors.neutral10),
                ),
                TextButton(
                  onPressed: () => Get.toNamed('/register_employer'),
                  child: Text(
                    'Daftar',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: IColors.secondary50,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
