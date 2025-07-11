import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:krua_pos/screens/order_screen/order_screen.dart';

import 'package:krua_pos/services/authentication.dart';

import 'package:krua_pos/screens/home_screen/home_screen.dart';
import 'package:krua_pos/screens/login_screen/login_screen.dart';
import 'package:krua_pos/screens/splash_screen/splash_screen.dart';
import 'package:krua_pos/screens/system_setup/user_management/user_management_screen.dart';

import 'package:krua_pos/routing/sale.routes.dart' as saleRoutes;
import 'package:krua_pos/routing/systemsetup.routes.dart' as systemSetupRoutes;
import 'package:krua_pos/routing/masterdata.dart' as masterDataRoutes;

part 'redirection.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/order',
      builder: (context, state) => const OrderScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
      routes: [
        ...saleRoutes.routes,
        ...masterDataRoutes.routes,
        ...systemSetupRoutes.routes,
      ]
    ),
  ],

  // redirect to the login page if the user is not logged in
  redirect: _redirect,
  refreshListenable: Authentication.instance,
  navigatorKey: Authentication.instance.navigatorKey,
);
