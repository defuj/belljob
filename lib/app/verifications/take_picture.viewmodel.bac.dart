import 'dart:io';

import 'package:belljob/packages.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';

class TakePictureViewModel extends ViewModel {
  bool _camera = false;
  bool get isCameraReady => _camera;
  set isCameraReady(bool value) {
    _camera = value;
    notifyListeners();
  }

  CameraController? _controller;
  CameraController get controller => _controller!;
  set controller(CameraController value) {
    _controller = value;
  }

  String _imagePath = '';
  String get imagePath => _imagePath;
  set imagePath(String value) {
    _imagePath = value;
    notifyListeners();
  }

  void initializeCamera(CameraDescription cameraDescription) {
    controller = CameraController(cameraDescription, ResolutionPreset.max);
    initializeController();
  }

  void initializeController() async {
    if (!isCameraReady) {
      await controller.initialize().then((value) => {isCameraReady = true});
    }
  }

  @override
  void onUnmount() {
    if (isCameraReady) {
      controller.dispose();
      isCameraReady = false;
    }
  }

  @override
  void onResume() {}

  @override
  void onPause() {
    if (isCameraReady) {
      controller.dispose();
      isCameraReady = false;
    }
  }

  @override
  void onInactive() {
    if (isCameraReady) {
      controller.dispose();
      isCameraReady = false;
    }
  }

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

    if (controller.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      //   await controller.takePicture(filePath);
      await controller.takePicture();
    } on CameraException {
      return null;
    }
    return filePath;
  }

  void takePicture() {
    if (isCameraReady) {
      takingPicture().then((String? filePath) => {
            if (filePath != null)
              {
                imagePath = filePath,
                isCameraReady = false,
              }
          });
    } else {
      isCameraReady = true;
    }
  }
}
