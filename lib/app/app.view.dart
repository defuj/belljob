import 'package:belljob/app/app.viewmodel.dart';
import 'package:belljob/packages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM<AppViewModel>(
      view: () => const _AppView(),
      viewModel: AppViewModel(),
    );
  }
}

class _AppView extends StatelessView<AppViewModel> {
  // set reactive to true to make the view listen to the view model's changes.
  const _AppView({Key? key}) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Belljob',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${viewModel.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () => viewModel.takePictureFace(),
              child: const Text('Ambil Gambar Wajah'),
            ),
            ElevatedButton(
              onPressed: () => viewModel.takePictureId(),
              child: const Text('Ambil Gambar e-KTP'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
