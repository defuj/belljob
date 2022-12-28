import 'repositories.dart';

Future<void> main() async {
  // runApp(const Root());
  var lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    textTheme: textTheme,
  );

//   var darkTheme = ThemeData(
//     useMaterial3: true,
//     colorScheme: darkColorScheme,
//     textTheme: textTheme,
//   );
  await GetStorage.init();
  runApp(GetMaterialApp(
    title: 'Bell Job',
    theme: lightTheme,
    // darkTheme: darkTheme,
    initialRoute: '/splash',
    getPages: getRoutes,
    translations: Translate(),
    locale: Get.deviceLocale, // Locale('id', 'ID')
    fallbackLocale: const Locale('en', 'US'), //Locale('en', 'US')
  ));
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    var lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      textTheme: textTheme,
    );

    var darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      textTheme: textTheme,
    );

    return MaterialApp(
      title: 'Bell Job',
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: '/splash',
      routes: routes,
    );
  }
}
