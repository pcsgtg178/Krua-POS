import 'package:go_router/go_router.dart';
import 'package:krua_pos/models/providers/authentication.dart';
import 'package:krua_pos/screens/home_screen/home_screen.dart';
import 'package:krua_pos/screens/login_screen/login_screen.dart';
import 'package:krua_pos/screens/payment_screen/payment_screen.dart';
import 'package:krua_pos/screens/sale_screen/sale_screen.dart';
import 'package:krua_pos/screens/splash_screen/splash_screen.dart';


class AppRouter {

  static final AppRouter _instance = AppRouter._internal();

  late final Authentication _auth;

  // Private constructor
  AppRouter._internal();

  factory AppRouter(Authentication auth) {
    _instance._auth = auth;
    return _instance;
  }

  // GoRouter configuration
  late final GoRouter _router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/sale',
        builder: (context, state) => const SaleScreen(),
        routes: [
          GoRoute(
            path: 'payment',
            builder: (context, state) => const PaymentScreen(),
          )
        ]
      )
    ],

    // redirect to the login page if the user is not logged in
    redirect: (context, GoRouterState state) {
      // if the user is not logged in, they need to login
      final bool loggedIn = _auth.loggedIn;
      final bool loggingIn = state.matchedLocation == '/login';

      final isSplash = state.matchedLocation == '/splash';

      // Allow the splash screen to show without redirecting immediately
      if (isSplash) {
        return null; // Do not redirect from /splash
      }
      
      if (!loggingIn && !loggedIn) {
        return '/login';
      } 

      // if the user is logged in but still on the login page, send them to
      // the home page
      if (loggedIn && loggingIn) {
        return '/';
      }

      // no need to redirect at all
      return null;
    },
    refreshListenable: _auth,
  );

  GoRouter get router => _router;
}

