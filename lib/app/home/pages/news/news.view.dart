import 'package:belljob/repositories.dart';

class NewsFragment extends StatelessWidget {
  const NewsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM<NewsFragmentViewModel>(
      view: () => const _View(),
      viewModel: NewsFragmentViewModel(),
    );
  }
}

class _View extends StatelessView<NewsFragmentViewModel> {
  const _View({key}) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('home.data.news'.tr),
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
