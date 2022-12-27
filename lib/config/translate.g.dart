import 'package:belljob/repositories.dart';

class LanguageType {
  static const String en = 'en_US';
  static const String id = 'id_ID';
}

class Translate extends Translations {
  final box = GetStorage();

  Map<String, Map<String, String>> _keys = {
    LanguageType.id: {
      ...actionID,
      ...dialogID,
      ...formID,
      ...labelID,
      ...dataID,
      ...AuthLanguages.id,
    },
    LanguageType.en: {
      ...actionEN,
      ...dialogEN,
      ...formEN,
      ...labelEN,
      ...dataEN,
      ...AuthLanguages.en,
    },
  };

  @override
  Map<String, Map<String, String>> get keys => _keys;

  set keys(Map<String, Map<String, String>> value) {
    _keys = value;
  }

  Translate() {
    box.listenKey('languages', (value) {
      keys.addAll(value);
    });
  }
}
