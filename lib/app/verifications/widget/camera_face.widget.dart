import 'package:belljob/app/verifications/index.dart';
import 'package:belljob/packages.dart';
import 'package:camera/camera.dart';

class CameraView extends StatelessWidget {
  final TakePictureViewModel? viewModel;
  const CameraView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Transform.scale(
        scale: 1,
        child: Center(
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: CameraPreview(viewModel!.controller!),
              ),
              Image.asset('assets/images/frame_camera_verification4.png')
            ],
          ),
        ),
      ),
    );
  }
}