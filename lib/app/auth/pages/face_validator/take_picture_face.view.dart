import 'package:belljob/repositories.dart';

class TakePictureFace extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String? pathName;
  const TakePictureFace({
    super.key,
    required this.cameras,
    this.pathName = 'picturePath',
  });

  @override
  State<TakePictureFace> createState() => _TakePictureFaceState();
}

class _TakePictureFaceState extends State<TakePictureFace> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MVVM<TakePictureViewModel>(
      view: () => const _TakePictureView(),
      viewModel:
          TakePictureViewModel(widget.cameras, pathName: widget.pathName),
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
          'action.take_picture'.tr,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.symmetric(vertical: 30),
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: viewModel.isCameraReady
                ? CameraView(viewModel: viewModel)
                : viewModel.imagePath == null
                    ? const Center(child: CircularProgressIndicator())
                    : ResultImageFace(imagePath: viewModel.imagePath),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () => viewModel.takePicture(),
              child: Text(
                viewModel.isCameraReady
                    ? 'action.take_picture'.tr
                    : 'action.re_take_picture'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
