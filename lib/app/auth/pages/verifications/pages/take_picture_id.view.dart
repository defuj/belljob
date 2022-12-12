import 'package:belljob/packages.dart';

class TakePictureId extends StatefulWidget {
  final List<CameraDescription> cameras;
  const TakePictureId({super.key, required this.cameras});

  @override
  State<TakePictureId> createState() => _TakePictureIdState();
}

class _TakePictureIdState extends State<TakePictureId> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MVVM<TakePictureViewModel>(
      view: () => const _TakePictureView(),
      viewModel: TakePictureViewModel(widget.cameras, cameraSelected: 'back'),
    );
  }
}

class _TakePictureView extends StatelessView<TakePictureViewModel> {
  const _TakePictureView({key}) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verifikasi e-KTP',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      backgroundColor: const Color(0xff1E1E1E),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            child: viewModel.isCameraReady
                ? CameraIDView(viewModel: viewModel)
                : viewModel.imagePath == null
                    ? Container()
                    : ResultImageID(imagePath: viewModel.imagePath),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Posisikan e-KTP di dalam kotak',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 62,
                  height: 62,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff1E1E1E),
                    border: Border.fromBorderSide(
                      BorderSide(color: Colors.white, width: 4),
                    ),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () => viewModel.takePicture(),
                    child: Container(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
