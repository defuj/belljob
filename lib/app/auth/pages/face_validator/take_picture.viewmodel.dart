import 'package:belljob/repositories.dart';

class TakePictureViewModel extends ViewModel {
  String cameraSelected = 'back';
  bool isCameraReady = false;
  final bool? faceVerification;
  final box = GetStorage();
  String? pathName;

  TakePictureViewModel(
    List<CameraDescription>? cameras, {
    this.cameraSelected = 'front',
    this.faceVerification = false,
    this.pathName = 'picturePath',
  }) {
    this.cameras = cameras!;
  }

  List<CameraDescription>? _cameras;
  List<CameraDescription> get cameras => _cameras!;
  set cameras(List<CameraDescription> value) {
    _cameras = value;
  }

  XFile? _imagePath;
  XFile? get imagePath => _imagePath;
  set imagePath(XFile? value) {
    _imagePath = value;
    notifyListeners();
  }

  CameraController? _controller;
  CameraController? get controller => _controller;
  set controller(CameraController? value) {
    _controller = value;
    notifyListeners();
  }

  void initializeCamera(CameraDescription cameraDescription) {
    controller = CameraController(cameraDescription, ResolutionPreset.max);
    initializeController();
  }

  void initializeController() async {
    if (!isCameraReady) {
      await controller?.initialize().then((value) => {isCameraReady = true});
      notifyListeners();
    }
  }

  void tryInitializeCamera() {
    try {
      initializeCamera(cameraSelected == 'front' ? cameras[1] : cameras[0]);
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Tidak ada kamera yang terdeteksi",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  void init() {
    tryInitializeCamera();
  }

  @override
  void onDependenciesChange() {}

  @override
  void onBuild() {}

  @override
  void onMount() {}

  @override
  void onUnmount() {
    if (isCameraReady) {
      controller?.dispose();
      isCameraReady = false;
    }
  }

  @override
  void onResume() {
    if (!isCameraReady) {
      tryInitializeCamera();
    }
  }

  @override
  void onPause() {
    if (isCameraReady) {
      controller?.dispose();
      isCameraReady = false;
    }
  }

  @override
  void onInactive() {
    if (isCameraReady) {
      controller?.dispose();
      isCameraReady = false;
    }
  }

  @override
  void onDetach() {}

  Future<XFile?> takingPicture() async {
    if (!isCameraReady) {
      return null;
    }

    if (controller!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile? file = await controller?.takePicture();
      return file;
    } on CameraException {
      return null;
    }
  }

  Future<void> verifyFace(Face face) async {
    if (faceVerification!) {
      if (face.leftEyeOpenProbability! < 0.5 ||
          face.rightEyeOpenProbability! < 0.5) {
        Fluttertoast.showToast(
          msg: "Silahkan buka mata anda",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }

      // If landmark detection was enabled with FaceDetectorOptions (mouth, ears,
      // eyes, cheeks, and nose available):
      final FaceLandmark? leftEar = face.landmarks[FaceLandmarkType.leftEar];
      if (leftEar == null) {
        Fluttertoast.showToast(
          msg: "Telinga kiri tidak terdeteksi",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        return;
      }

      final FaceLandmark? rightEar = face.landmarks[FaceLandmarkType.rightEar];
      if (rightEar == null) {
        Fluttertoast.showToast(
          msg: "Telinga kanan tidak terdeteksi",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }

      // If classification was enabled with FaceDetectorOptions:
      if (face.smilingProbability == null) {
        Fluttertoast.showToast(
          msg: "Tertawa",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }

      final FaceLandmark? nose = face.landmarks[FaceLandmarkType.noseBase];
      if (nose == null) {
        Fluttertoast.showToast(
          msg: "Hidung tidak terdeteksi",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }
    }

    controller?.dispose();
    isCameraReady = false;

    await box.write(pathName!, imagePath!.path);
    Get.back();
  }

  void takePicture() async {
    if (isCameraReady) {
      takingPicture().then((imageFile) {
        FaceDetectorUtils(imageFile: imageFile!).processDetectFace(
          DetectingResult(
            onFaceDetected: (face) {
              imagePath = imageFile;
              verifyFace(face);
            },
            onFaceNotDetected: () {
              Fluttertoast.showToast(
                msg: "Wajah tidak terdeteksi",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            },
          ),
        );
      });
    } else {
      tryInitializeCamera();
    }
  }
}
