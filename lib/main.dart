import 'packages.dart';

void main() {
//   runApp(const Root());
  runApp(GetMaterialApp(
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
    initialRoute: '/splash',
    getPages: getRoutes,
  ));
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
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
      initialRoute: '/',
      routes: routes,
    );
  }
}
