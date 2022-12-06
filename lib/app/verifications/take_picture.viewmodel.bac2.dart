import 'dart:io';

import 'package:belljob/packages.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';

class TakePictureViewModel extends ViewModel {
  CameraController? controller;
  bool isCameraReady = false;
  String imagePath = '';
  CameraDescription? cameraDescription;

  void initializeCamera(CameraDescription cameraDescription) {
    controller ??= CameraController(cameraDescription, ResolutionPreset.high);
    this.cameraDescription = cameraDescription;
    initializeController();
  }

  void initializeController() async {
    if (!isCameraReady) {
      await controller?.initialize().then((value) => {isCameraReady = true});
      notifyListeners();
    }
  }

  @override
  void init() {}

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
  void onResume() {}

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

  Future<String?> takingPicture() async {
    if (!isCameraReady) {
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    // get a timestamp
    String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
    final String filePath = '$dirPath/${timestamp()}.jpg';

    if (controller!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      await controller?.takePicture();
    } on CameraException {
      return null;
    }
    return filePath;
  }

  void takePicture() async {
    if (isCameraReady) {
      takingPicture().then((value) {
        imagePath = value!;
        isCameraReady = false;
        controller?.dispose();
        controller = null;
        notifyListeners();
      });
    } else {
      initializeCamera(cameraDescription!);
    }
  }
}
