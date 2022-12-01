import 'package:belljob/app/app.view.dart';
import 'packages.dart';

void main() {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    const textTheme = TextTheme(
      headline6: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
      ),
      headline5: TextStyle(
        fontSize: 36.0,
        fontStyle: FontStyle.italic,
      ),
      headline4: TextStyle(
        fontSize: 19.0,
        fontStyle: FontStyle.normal,
        fontFamily: 'Inter',
      ),
      headline3: TextStyle(
        fontSize: 32.0,
        fontStyle: FontStyle.normal,
        fontFamily: 'Inter',
      ),
      headline2: TextStyle(
        fontSize: 33.0,
        fontStyle: FontStyle.normal,
        fontFamily: 'Inter',
        letterSpacing: 0.25,
      ),
      headline1: TextStyle(
        fontSize: 47.0,
        fontStyle: FontStyle.normal,
        fontFamily: 'Inter',
      ),
      subtitle2: TextStyle(
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
        fontFamily: 'Inter',
      ),
      subtitle1: TextStyle(
        fontSize: 16.0,
        fontStyle: FontStyle.normal,
        fontFamily: 'Inter',
      ),
      bodyText2: TextStyle(
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
        fontFamily: 'Inter',
      ),
      bodyText1: TextStyle(
        fontSize: 16.0,
        fontStyle: FontStyle.normal,
        fontFamily: 'Inter',
        letterSpacing: 0.20,
      ),
      button: TextStyle(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontFamily: 'Inter',
      ),
      caption: TextStyle(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontFamily: 'Inter',
      ),
      overline: TextStyle(
        fontSize: 10,
        fontStyle: FontStyle.normal,
        fontFamily: 'Inter',
      ),
    );
    return MaterialApp(
      title: 'Bell Job',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: textTheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textTheme: textTheme,
      ),
      home: const App(),
    );
  }
}
