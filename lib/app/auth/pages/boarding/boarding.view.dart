import 'package:belljob/packages.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Boarding extends StatelessWidget {
  const Boarding({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM<BoardingViewModel>(
      view: () => const _BoardingView(),
      viewModel: BoardingViewModel(),
    );
  }
}

class _BoardingView extends StatelessView<BoardingViewModel> {
  const _BoardingView({key}) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    return Scaffold(
      body: SlidingUpPanel(
        maxHeight: 555,
        minHeight: 0,
        parallaxEnabled: true,
        backdropEnabled: true,
        backdropOpacity: 0.5,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        controller: viewModel.panelController,
        panel: viewModel.loginType == LoginType.worker
            ? const LoginWorker()
            : const LoginEmployer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Boarding Screen',
                style: Theme.of(context).textTheme.headline3,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () => viewModel.loginType = LoginType.worker,
                  child: const Text('Cari Pekerja'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () => viewModel.loginType = LoginType.employer,
                  child: const Text('Jadi Pekerja'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
