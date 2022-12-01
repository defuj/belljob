import 'package:belljob/app/app.view.dart';
import 'package:belljob/app/splash/index.dart';
import 'package:belljob/packages.dart';

var routes = <String, WidgetBuilder>{
  '/': (context) => const Splash(),
  '/main': (context) => const App(),
};
