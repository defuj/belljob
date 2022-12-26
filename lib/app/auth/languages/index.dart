import 'action.en.dart';
import 'action.id.dart';
import 'dialog.en.dart';
import 'dialog.id.dart';
import 'form.en.dart';
import 'form.id.dart';
import 'label.en.dart';
import 'label.id.dart';
import 'data.en.dart';
import 'data.id.dart';

class AuthLanguages {
  static const Map<String, String> en = {
    ...actionEN,
    ...dialogEN,
    ...formEN,
    ...labelEN,
    ...dataEN,
  };
  static const Map<String, String> id = {
    ...actionID,
    ...dialogID,
    ...formID,
    ...labelID,
    ...dataID,
  };
}
