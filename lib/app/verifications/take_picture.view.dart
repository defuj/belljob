import 'dart:io';

import 'package:belljob/app/verifications/index.dart';
import 'package:belljob/packages.dart';
import 'package:camera/camera.dart';

class TakePicture extends StatefulWidget {
  final List<CameraDescription> cameras;
  const TakePicture({super.key, required this.cameras});

  @override
  State<TakePicture> createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MVVM<TakePictureViewModel>(
      view: () => _TakePictureView(cameras: widget.cameras),
      viewModel: TakePictureViewModel(widget.cameras),
    );
  }
}

class _TakePictureView extends StatelessView<TakePictureViewModel> {
  final List<CameraDescription> cameras;
  const _TakePictureView({key, required this.cameras})
      : super(key: key, reactive: true);

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
            child: ClipOval(
              child: viewModel.isCameraReady
                  ? Transform.scale(
                      scale: 1,
                      child: Center(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: CameraPreview(viewModel.controller!),
                        ),
                      ),
                    )
                  : viewModel.imagePath == null
                      ? Image.asset(
                          'assets/images/male_placeholder.jpeg',
                          fit: BoxFit.fill,
                        )
                      : Image.file(File(viewModel.imagePath!.path),
                          fit: BoxFit.fill),
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
