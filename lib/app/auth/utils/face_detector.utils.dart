import 'package:belljob/repositories.dart';

class DetectingResult {
  final Function(Face) onFaceDetected;
  final Function onFaceNotDetected;

  DetectingResult({
    required this.onFaceDetected,
    required this.onFaceNotDetected,
  });
}

class FaceDetectorUtils {
  final XFile imageFile;
  FaceDetectorUtils({required this.imageFile});

  void processDetectFace(DetectingResult result) async {
    FaceDetectorOptions options = FaceDetectorOptions(
      enableContours: true,
      enableClassification: true,
      enableLandmarks: true,
      enableTracking: false,
    );
    FaceDetector faceDetector = FaceDetector(options: options);

    List<Face> faces = await faceDetector.processImage(
      InputImage.fromFilePath(imageFile.path),
    );

    faces.isNotEmpty
        ? result.onFaceDetected(faces[0])
        : result.onFaceNotDetected();
  }
}
