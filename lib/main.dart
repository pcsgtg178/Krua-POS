import 'package:flutter/material.dart';
import 'package:krua_pos/constants/theme.dart';
import 'package:provider/provider.dart';
import 'package:krua_pos/services/authentication.dart';
import 'package:krua_pos/routing/router.dart';

void main() {
  print('run main');
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    Application()
  );
}

class Application extends StatefulWidget {

  const Application({Key? key}) : super(key: key);

  @override
  State createState() {
    return ApplicationState();
  }
}

class ApplicationState extends State<Application> {

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light, //or ThemeMode.dark
      theme: GlobalThemeData.lightThemeData,
      darkTheme: GlobalThemeData.darkThemeData,
    );
  }
}