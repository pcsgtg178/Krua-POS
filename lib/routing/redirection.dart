part of 'router.dart';

String? _redirect(BuildContext context, GoRouterState state) {
 final isLoggedIn = Authentication.instance.loggedIn;
 final isLoginRoute = state.matchedLocation == '/login';

 if (!isLoggedIn && !isLoginRoute) {
  return '/login';
 } else if (isLoggedIn && isLoginRoute) {
  return '/';
 }
 return null;
}