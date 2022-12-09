import 'package:belljob/app/app.view.dart';
import 'package:belljob/app/splash/index.dart';
import 'package:belljob/packages.dart';

var routes = <String, WidgetBuilder>{
  '/': (context) => const Splash(),
  '/main': (context) => const App(),
};

var getRoutes = [
  GetPage(
    name: '/',
    page: () => const Splash(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: '/main',
    page: () => const App(),
    transition: Transition.cupertino,
  ),
];
