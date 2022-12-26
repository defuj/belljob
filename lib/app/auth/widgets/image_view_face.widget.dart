import 'dart:io';
import 'package:belljob/repositories.dart';
import 'dart:math' as math;

class ResultImageFace extends StatelessWidget {
  final XFile? imagePath;
  const ResultImageFace({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(math.pi),
      child: ClipOval(
        child: Transform.scale(
          scale: 1.0,
          child: Center(
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: OverflowBox(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Image.file(File(imagePath!.path), fit: BoxFit.fill),
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
