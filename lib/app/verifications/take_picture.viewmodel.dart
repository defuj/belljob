import 'package:belljob/packages.dart';
import 'package:camera/camera.dart';

class TakePictureViewModel extends ViewModel {
  TakePictureViewModel(List<CameraDescription> cameras) {
    this.cameras = cameras;
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

  bool isCameraReady = false;

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

  @override
  void init() {
    initializeCamera(cameras[1]);
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
      initializeCamera(cameras[1]);
    }
  }
}
