import 'package:belljob/packages.dart';

class FindAccount extends StatelessWidget {
  final String? nextPage;
  final String? title;
  final String? accountType;
  final String? action;
  const FindAccount({
    super.key,
    required this.nextPage,
    required this.title,
    required this.accountType,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return MVVM<FindAccountViewModel>(
      view: () => _FindAccountView(
        nextPage: nextPage,
        title: title,
        accountType: accountType,
        action: action,
      ),
      viewModel: FindAccountViewModel(
        nextPage: nextPage,
        action: action,
      ),
    );
  }
}

class _FindAccountView extends StatelessView<FindAccountViewModel> {
  final String? nextPage;
  final String? title;
  final String? accountType;
  final String? action;
  const _FindAccountView({
    key,
    required this.nextPage,
    required this.title,
    required this.accountType,
    required this.action,
  }) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: Container(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: IColors.neutral20, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Masukan nomor Handphone terdaftar untuk melanjutkan',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: IColors.neutral10),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32, bottom: 6),
              child: Text(
                'Nomor Handphone',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: IColors.neutral10,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            InputPhoneNumber(
              onChanged: (value) {
                viewModel.phoneNumber = '+62$value';
              },
            ),
            Container(
              padding: const EdgeInsets.only(top: 24, bottom: 24),
              child: ButtonPrimary(
                text: 'Kirim Verifikasi',
                onPressed: viewModel.sendVerification,
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
    );
  }
}
