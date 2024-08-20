import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:krua_pos/models/providers/authentication.dart';
import 'package:krua_pos/routing.dart';

void main() {

  final auth = Authentication();

  WidgetsFlutterBinding.ensureInitialized();

  final appRouter = AppRouter(auth);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Authentication>(create: (_) => auth),
      ],
      child: Application(appRouter: appRouter)
    )
  );
}

class Application extends StatefulWidget {

  const Application({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  @override
  State createState() {
    return ApplicationState();
  }
}

class ApplicationState extends State<Application> {

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
      routerConfig: widget.appRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}