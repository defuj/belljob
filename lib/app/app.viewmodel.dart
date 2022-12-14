import 'dart:developer';
import 'package:belljob/repositories.dart';

class AppViewModel extends ViewModel {
  int counter = 0;

  void takePictureFace() async {
    await availableCameras()
        .then((value) => Get.to(TakePictureFace(cameras: value)));
  }

  void takePictureId() async {
    await availableCameras()
        .then((value) => Get.to(TakePictureId(cameras: value)));
  }

  void incrementCounter() {
    counter++;
    notifyListeners();
    if (counter == 6) {
      SweetDialog(
        dialogType: DialogType.warning.toString(),
        context: context,
        title: 'Kembali ke SplashScreen?',
        content:
            'Kembali ke SplashScreen akan menghapus semua data yang belum disimpan',
        cancelText: 'Batal',
        confirmText: 'Lanjutkan',
        onConfirm: () => Get.offAllNamed('/splash'),
      ).show();
    }

    if (counter == 3) {
      DatePicker.showTimePicker(
        context,
        showSecondsColumn: false,
        showTitleActions: true,
        onConfirm: (time) {
          log('confirm $time');
          // format time from yyyy-dd-mm HH:MM:SS to HH:MM
          String formattedTime = time.toString().substring(11, 16);
          log('formattedTime $formattedTime');

          // format time from yyyy-dd-mm HH:MM:SS to milliseconds
          int milliseconds = time.millisecondsSinceEpoch;
          log('milliseconds $milliseconds');
        },
        currentTime: DateTime.now(),
        locale: LocaleType.id,
      );
    }
  }

  /// A callback after the MVVM widget's initState is called.
  /// See also:
  /// * [onDependenciesChange], which is called when the MVVM widget's [didChangeDependencies]
  /// is called.
  @override
  void init() {}

  /// A callback when the MVVM widget's [didChangeDependencies] is called.
  /// For example, when `context.fetch<T>(listen: true/false)` is used within the view model,
  /// then the [onDependenciesChange] method will be called every time these dependencies change.
  @override
  void onDependenciesChange() {}

  /// A callback when the `build` method of the view is called.
  @override
  void onBuild() {}

  /// A callback when the view is mounted.
  @override
  void onMount() {}

  /// A callback when the view is unmounted
  @override
  void onUnmount() {}

  /// Event callback when the application is visible and responding to user input.
  @override
  void onResume() {}

  /// Event callback when the application is not currently visible to the user, not responding to
  /// user input, and running in the background.
  @override
  void onPause() {}

  /// Event callback when the application is in an inactive state and is not receiving user input.
  /// For [IOS] only.
  @override
  void onInactive() {}

  /// Event callback when the application is still hosted on a flutter engine but
  /// is detached from any host views.
  /// For [Android] only.
  @override
  void onDetach() {}
}
