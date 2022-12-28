import 'package:belljob/repositories.dart';

class OrdersFragment extends StatelessWidget {
  const OrdersFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM<OrdersFragmentViewModel>(
      view: () => const _View(),
      viewModel: OrdersFragmentViewModel(),
    );
  }
}

class _View extends StatelessView<OrdersFragmentViewModel> {
  const _View({key}) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('home.data.orders'.tr),
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
