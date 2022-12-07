import 'dart:io';

import 'package:belljob/app/verifications/index.dart';
import 'package:belljob/app/verifications/widget/camera_face.widget.dart';
import 'package:belljob/packages.dart';
import 'package:camera/camera.dart';
import 'dart:math' as math;

class TakePictureFace extends StatefulWidget {
  final List<CameraDescription> cameras;
  const TakePictureFace({super.key, required this.cameras});

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
      viewModel: TakePictureViewModel(widget.cameras),
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
          'Ambil Gambar Diri',
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
                    : ClipOval(
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(math.pi),
                          child: Image.file(
                            File(viewModel.imagePath!.path),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
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
                viewModel.isCameraReady ? 'Ambil Gambar' : 'Ambil Ulang',
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