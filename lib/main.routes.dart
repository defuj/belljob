import 'package:belljob/packages.dart';

var routes = <String, WidgetBuilder>{
  '/': (context) => const Splash(),
  '/main': (context) => const App(),
};

var getRoutes = [
  GetPage(
    name: '/splash',
    page: () => const Splash(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: '/boarding',
    page: () => const Boarding(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: '/register_employer',
    page: () => const RegisterEmployer(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: '/register_worker',
    page: () => const RegisterWorker(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: '/otp',
    page: () => const Otp(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: '/forgot_password',
    page: () => const ForgotPassword(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: '/reset_password',
    page: () => const ResetPassword(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: '/main',
    page: () => const App(),
    transition: Transition.cupertino,
  ),
];
