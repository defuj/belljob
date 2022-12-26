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
      'form.label.phone': 'Nomor Handphone',
      'form.hint.phone': 'Masukkan Nomor Handphone',
      'form.label.password': 'Kata Sandi',
      'form.hint.password': 'Masukkan Kata Sandi',
      'action.forgot_password': 'Lupa kata sandi?',
      'action.employer.login': 'Masuk sebagai Pencari Pekerja',
      'label.dont_have_account': 'Belum punya akun? ',
      'action.register': 'Daftar',
      'auth.login.worker': 'Raih penghasilan tambahan bersama Bell Job',
      'action.worker.login': 'Masuk sebagai Pekerja',
      'label.register.title': 'Pendaftaran Akun',
      'label.register.desc': 'Lengkapi form untuk melanjutkan pendaftaran',
      'form.label.full_name': 'Nama Lengkap',
      'form.hint.full_name': 'Masukkan nama lengkap',
      'form.label.password_confirmation': 'Ulangi Kata Sandi',
      'form.hint.password_confirmation': 'Masukkan ulang kata sandi',
      'label.have_account': 'Sudah punya akun?',
      'action.login': 'Masuk',
      'label.register.worker.title': 'Buat Akun Pekerja',
      'form.label.profile_picture': 'Foto Profil',
      'form.label.address': 'Alamat',
      'form.hint.address': 'Masukkan alamat',
      'form.label.gender': 'Jenis Kelamin',
      'form.label.job_type': 'Jenis Pekerjaan',
      'form.hint.job_type': 'Pilih jenis pekerjaan',
      'action.tap_to_add_picture': 'Ketuk untuk menambahkan foto',
      'action.change_profile_picture': 'Ubah Foto Profil',
      'action.send_verification_code': 'Kirim Kode Verifikasi',
      'label.input_registered_phone':
          'Masukan nomor Handphone terdaftar untuk melanjutkan',
      'dialog.empty_phone.title': 'Nomor handphone tidak boleh kosong',
      'dialog.empty_phone.desc':
          'Silahkan isi nomor handphone anda terlebih dahulu untuk melanjutkan',
      'action.understand': 'Mengerti',
      'dialog.invalid_phone.title': 'Nomor handphone tidak valid',
      'dialog.invalid_phone.desc':
          'Silahkan masukkan nomor handphone yang valid',
      'label.forgot_password': 'Lupa Kata Sandi',
      'dialog.login_success.title': 'Berhasil Masuk',
      'dialog.login_success.desc': 'Selamat datang kembali',
      'action.next': 'Lanjutkan',
      'dialog.empty_password.title': 'Kata sandi tidak boleh kosong',
      'dialog.empty_password.desc':
          'Silahkan isi kata sandi anda terlebih dahulu',
      'label.password_min_length': 'Kata sandi minimal 8 karakter',
      'label.password_max_length': 'Kata sandi maksimal 20 karakter',
      'label.password_no_space': 'Kata sandi tidak boleh mengandung spasi',
      'label.password_capital_letter':
          'Kata sandi harus mengandung minimal 1 huruf capital',
      'label.password_lowercase_letter':
          'Kata sandi harus mengandung minimal 1 huruf kecil',
      'label.password_number': 'Kata sandi harus mengandung minimal 1 angka',
      'label.input_verification_code': 'Masukan Kode Verifikasi',
      'label.input_verification_code_sent':
          'Masukan kode verifikasi yang telah dikirimkan melalui SMS ke @phone',
      'label.not_received_code': 'Belum menerima kode verifikasi? ',
      'action.resend_code': 'Kirim ulang kode',
      'label.wait': 'Tunggu',
      'action.confirm': 'Konfirmasi',
      'label.change_phone_number': 'Ubah nomor handphone? ',
      'action.change': 'Ubah',
      'dialog.empty_verification_code.title':
          'Kode verifikasi tidak boleh kosong',
      'dialog.empty_verification_code.desc':
          'Silahkan isi kode verifikasi anda terlebih dahulu untuk melanjutkan',
      'dialog.invalid_verification_code.title': 'Kode verifikasi tidak valid',
      'dialog.invalid_verification_code.desc':
          'Silahkan masukkan kode verifikasi yang valid',
      'label.verification_id_card': 'Verifikasi KTP',
      'label.prepare_id_card': 'Siapkan e-KTP',
      'label.confirm_id_card': 'Konfirmasi e-KTP',
      'verification.id_card.note':
          'Data kamu hanya digunakan untuk proses verifikasi, data kamu bakalan tersimpan dan terlindungi.',
      'verification.id_card.desc':
          'Pastikan KTP kamu masih bisa terbaca dengan baik',
      'action.take_picture': 'Ambil Foto',
      'action.re_take_picture': 'Ambil Ulang Foto',
      'label.choose_job_type': 'Pilih Jenis Pekerjaan',
      'label.gender.male': 'Laki-Laki',
      'label.gender.female': 'Perempuan',
      'dialog.no_profile_picture.title': 'Foto profil tidak boleh kosong',
      'dialog.no_profile_picture.desc':
          'Silahkan pilih foto profil anda terlebih dahulu untuk melanjutkan',
      'dialog.no_address.title': 'Alamat tidak boleh kosong',
      'dialog.no_address.desc':
          'Silahkan isi alamat terlebih dahulu untuk melanjutkan',
      'dialog.no_job_type.title': 'Belum memilih jenis pekerjaan',
      'dialog.no_job_type.desc':
          'Silahkan pilih jenis pekerjaan terlebih dahulu untuk melanjutkan',
      'dialog.empty_name.title': 'Nama tidak boleh kosong',
      'dialog.empty_name.desc':
          'Silahkan isi nama lengkap anda terlebih dahulu untuk melanjutkan',
      'dialog.empty_password_confirm.title':
          'Konfirmasi kata sandi tidak boleh kosong',
      'dialog.empty_password_confirm.desc':
          'Silahkan isi konfirmasi kata sandi anda terlebih dahulu',
      'dialog.password_not_match.title': 'Konfirmasi kata sandi tidak cocok',
      'dialog.password_not_match.desc':
          'Silahkan masukan konfirmasi kata sandi anda yang cocok',
      'dialog.invalid_password.title': 'Kata sandi tidak valid',
      'data.job.builder': 'Tukang Bangungan',
      'data.job.carpenter': 'Tukang Kayu',
      'data.job.cook': 'Koki',
      'data.job.driver': 'Supir',
      'data.job.electrician': 'Tukang Listrik',
      'data.job.gardener': 'Tukang Taman',
      'data.job.maid': 'Bidan',
      'data.job.mechanic': 'Tukang Mesin',
      'data.job.painter': 'Tukang Cat',
      'data.job.plumber': 'Tukang Air',
      'data.job.seamstress': 'Tukang Jahit',
      'data.job.welder': 'Tukang Las',
      'data.job.other': 'Lainnya',
      'label.put_id_card_in_the_box': 'Posisikan e-KTP di dalam kotak',
      'form.label.new_password': 'Kata Sandi Baru',
      'form.hint.new_password': 'Masukan Kata Sandi Baru',
      'form.label.new_password_confirmation': 'Ulangi Kata Sandi Baru',
      'form.hint.new_password_confirmation': 'Masukan Ulang Kata Sandi Baru',
      'action.change_password': 'Ubah Kata Sandi',
      'label.safe_your_account': 'Pastikan akun kamu tetap aman',
      'dialog.password_changed.title': 'Kata sandi berhasil diubah',
      'dialog.password_changed.desc':
          'Kata sandi kamu berhasil diubah, silahkan login kembali',
    },
    LanguageType.en: {
      ...actionEN,
      ...dialogEN,
      ...formEN,
      ...labelEN,
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
      'form.label.phone': 'Phone Number',
      'form.hint.phone': 'Enter Phone Number',
      'form.label.password': 'Password',
      'form.hint.password': 'Enter Password',
      'action.forgot_password': 'Forgot Password?',
      'action.employer.login': 'Login as Employer',
      'label.dont_have_account': 'Don\'t have an account? ',
      'action.register': 'Register',
      'auth.login.worker': 'Earn extra income with Bell Job',
      'action.worker.login': 'Login as Worker',
      'label.register.title': 'Account Registration',
      'label.register.desc': 'Fill in the form to continue registration',
      'form.label.full_name': 'Full Name',
      'form.hint.full_name': 'Enter full name',
      'form.label.password_confirmation': 'Repeat Password',
      'form.hint.password_confirmation': 'Enter password again',
      'label.have_account': 'Already have an account? ',
      'action.login': 'Login',
      'label.register.worker.title': 'Create Worker Account',
      'form.label.profile_picture': 'Profile Picture',
      'form.label.address': 'Address',
      'form.hint.address': 'Enter address',
      'form.label.gender': 'Gender',
      'form.label.job_type': 'Job Type',
      'form.hint.job_type': 'Select job type',
      'action.tap_to_add_picture': 'Tap to add picture',
      'action.change_profile_picture': 'Change Profile Picture',
      'action.send_verification_code': 'Send Verification Code',
      'label.input_registered_phone':
          'Enter the registered phone number to continue',
      'dialog.empty_phone.title': 'Phone number cannot be empty',
      'dialog.empty_phone.desc':
          'Please fill in your phone number first to continue',
      'action.understand': 'Understand',
      'dialog.invalid_phone.title': 'Invalid phone number',
      'dialog.invalid_phone.desc': 'Please enter a valid phone number',
      'label.forgot_password': 'Forgot Password',
      'dialog.login_success.title': 'Login Success',
      'dialog.login_success.desc': 'Welcome back',
      'action.next': 'Next',
      'dialog.empty_password.title': 'Password cannot be empty',
      'dialog.empty_password.desc': 'Please fill in your password first',
      'label.password_min_length': 'Password must be at least 8 characters',
      'label.password_max_length': 'Password must be at most 20 characters',
      'label.password_no_space': 'Password cannot contain spaces',
      'label.password_capital_letter':
          'Password must contain at least 1 capital letter',
      'label.password_lowercase_letter':
          'Password must contain at least 1 lowercase letter',
      'label.password_number': 'Password must contain at least 1 number',
      'label.input_verification_code': 'Enter Verification Code',
      'label.input_verification_code_sent':
          'Enter the verification code that has been sent via SMS to @phone',
      'label.not_received_code': 'Not receive verification code? ',
      'action.resend_code': 'Resend code',
      'label.wait': 'Wait',
      'action.confirm': 'Confirm',
      'label.change_phone_number': 'Change phone number? ',
      'action.change': 'Change',
      'dialog.empty_verification_code.title':
          'Verification code cannot be empty',
      'dialog.empty_verification_code.desc':
          'Please fill in your verification code first',
      'dialog.invalid_verification_code.title': 'Invalid verification code',
      'dialog.invalid_verification_code.desc':
          'Please enter a valid verification code',
      'label.verification_id_card': 'ID Card Verification',
      'label.prepare_id_card': 'Prepare ID Card',
      'label.confirm_id_card': 'Confirm ID Card',
      'verification.id_card.note':
          'Your data is only used for verification purposes, your data will be stored and protected.',
      'verification.id_card.desc': 'Make sure your ID card is still readable',
      'action.take_picture': 'Take Picture',
      'action.re_take_picture': 'Re-Take Picture',
      'label.choose_job_type': 'Choose Job Type',
      'label.gender.male': 'Male',
      'label.gender.female': 'Female',
      'dialog.no_profile_picture.title': 'Profile picture cannot be empty',
      'dialog.no_profile_picture.desc':
          'Please select your profile picture first to continue',
      'dialog.no_address.title': 'Address cannot be empty',
      'dialog.no_address.desc': 'Please fill in your address first to continue',
      'dialog.no_job_type.title': 'No job type selected',
      'dialog.no_job_type.desc':
          'Please select your job type first to continue',
      'dialog.empty_name.title': 'Full name cannot be empty',
      'dialog.empty_name.desc':
          'Please fill in your full name first to continue',
      'dialog.password_not_match.title': 'Password not match',
      'dialog.password_not_match.desc': 'Please enter the same password',
      'dialog.invalid_password.title': 'Invalid password',
      'data.job.builder': 'Builder',
      'data.job.carpenter': 'Carpenter',
      'data.job.cook': 'Cook',
      'data.job.driver': 'Driver',
      'data.job.electrician': 'Electrician',
      'data.job.gardener': 'Gardener',
      'data.job.maid': 'Maid',
      'data.job.mechanic': 'Mechanic',
      'data.job.painter': 'Painter',
      'data.job.plumber': 'Plumber',
      'data.job.seamstress': 'Seamstress',
      'data.job.welder': 'Welder',
      'data.job.other': 'Other',
      'label.put_id_card_in_the_box': 'Put ID Card in the box',
      'form.label.new_password': 'New Password',
      'form.hint.new_password': 'Enter new password',
      'form.label.new_password_confirmation': 'Repeat New Password',
      'form.hint.new_password_confirmation': 'Enter new password again',
      'action.change_password': 'Change Password',
      'label.safe_your_account': 'Safe Your Account',
      'dialog.password_changed.title': 'Password Changed',
      'dialog.password_changed.desc':
          'Your password has been changed, please login again',
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
