import 'package:belljob/packages.dart';

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
        title: 'Pendaftaran Akun',
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pendaftaran akun',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: IColors.neutral20, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Lengkapi form untuk melanjutkan pendaftaran',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: IColors.neutral20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 4),
                child: Text(
                  'Nama Lengkap',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: IColors.neutral10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                ),
              ),
              InputText(
                hintText: 'Masukkan nama lengkap',
                onChanged: (value) => viewModel.name = value,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 4),
                child: Text(
                  'Nomor Handphone',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: IColors.neutral10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                ),
              ),
              InputPhoneNumber(
                hintText: 'Masukkan nomor handphone',
                onChanged: (value) => viewModel.phone = '+62$value',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 4),
                child: Text(
                  'Kata Sandi',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: IColors.neutral10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                ),
              ),
              InputPassword(
                hintText: 'Masukkan kata sandi',
                onChanged: (value) => viewModel.password = value,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 4),
                child: Text(
                  'Ulangi Kata Sandi',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: IColors.neutral10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                ),
              ),
              InputPassword(
                hintText: 'Masukkan ulang kata sandi',
                onChanged: (value) => viewModel.confirmPassword = value,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 16),
                child: ButtonPrimary(
                  text: 'Daftar',
                  onPressed: () => viewModel.validate(
                    accountType: AccountType.employer.toString(),
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun? ',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: IColors.neutral20,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.15,
                          ),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Text(
                        'Masuk',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: IColors.secondary50,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.15,
                            ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
