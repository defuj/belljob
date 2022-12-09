import 'package:belljob/packages.dart';

class CameraIDView extends StatelessWidget {
  final TakePictureViewModel? viewModel;
  const CameraIDView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffF2F2F2),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Transform.scale(
          scale: 1.0,
          child: Center(
            child: AspectRatio(
              aspectRatio: 3.0 / 2.0,
              child: OverflowBox(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        CameraPreview(viewModel!.controller!),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
