import 'package:belljob/repositories.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM<ProfileFragmentViewModel>(
      view: () => const _View(),
      viewModel: ProfileFragmentViewModel(),
    );
  }
}

class _View extends StatelessView<ProfileFragmentViewModel> {
  const _View({key}) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('home.data.profile'.tr),
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
