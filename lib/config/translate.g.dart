import 'package:belljob/repositories.dart';

class LanguageType {
  static const String en = 'en_US';
  static const String id = 'id_ID';
}

class Translate extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        LanguageType.id: {
          ...dialogID,
          ...formID,
          ...dataID,
          ...AuthLanguages.id,
        },
        LanguageType.en: {
          ...dialogEN,
          ...formEN,
          ...dataEN,
          ...AuthLanguages.en,
        },
      };
}
