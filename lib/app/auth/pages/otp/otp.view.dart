import 'package:belljob/packages.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM<OtpViewModel>(
      view: () => const _OtpView(),
      viewModel: OtpViewModel(),
    );
  }
}

class _OtpView extends StatelessView<OtpViewModel> {
  const _OtpView({key}) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    return const Scaffold();
  }
}
