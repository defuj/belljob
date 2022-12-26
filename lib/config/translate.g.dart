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
      'auth.boarding.action1.title': 'Cari Pekerja',
      'auth.boarding.action1.desc': 'Pesan jasa untuk membantu pekerjaanmu',
      'auth.boarding.action2.title': 'Jadi Pekerja',
      'auth.boarding.action2.desc': 'Bantu orang lain menyelesaikan masalahnya',
      'auth.boarding.agreement.1':
          'Dengan masuk atau mendaftar, kamu menyetujui ',
      'auth.boarding.agreement.terms': 'Ketentuan Layanan',
      'auth.boarding.agreement.2': ' dan ',
      'auth.boarding.agreement.privacy': 'Kebijakan Privasi',
      'auth.boarding.agreement.3': ' kami.',
      'auth.login.welcome': 'Selamat datang kembali',
      'auth.login.employer': 'Temukan pekerja yang cocok untuk kamu!',
      'auth.login.worker': 'Raih penghasilan tambahan bersama Bell Job',
      'verification.id_card.note':
          'Data kamu hanya digunakan untuk proses verifikasi, data kamu bakalan tersimpan dan terlindungi.',
      'verification.id_card.desc':
          'Pastikan KTP kamu masih bisa terbaca dengan baik',
    },
    LanguageType.en: {
      ...actionEN,
      ...dialogEN,
      ...formEN,
      ...labelEN,
      ...dataEN,
      ...AuthLanguages.en,
      'auth.boarding.action1.title': 'Looking for Workers',
      'auth.boarding.action1.desc': 'Order services to help your work',
      'auth.boarding.action2.title': 'Become a Worker',
      'auth.boarding.action2.desc': 'Help others solve their problems',
      'auth.boarding.agreement.1':
          'By logging in or registering, you agree to our ',
      'auth.boarding.agreement.terms': 'Terms of Service',
      'auth.boarding.agreement.2': ' and ',
      'auth.boarding.agreement.privacy': 'Privacy Policy',
      'auth.boarding.agreement.3': '.',
      'auth.login.welcome': 'Welcome Back',
      'auth.login.employer': 'Find workers that fit your needs!',
      'auth.login.worker': 'Earn extra income with Bell Job',
      'verification.id_card.note':
          'Your data is only used for verification purposes, your data will be stored and protected.',
      'verification.id_card.desc': 'Make sure your ID card is still readable',
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
