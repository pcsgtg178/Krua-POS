import 'package:flutter/material.dart';

class Authentication extends ChangeNotifier {
  
  Authentication._();

  factory Authentication() => _instance;

  static Authentication get instance => _instance;
  static final Authentication _instance = Authentication._();

  /// The username of login.
  String get userName => _userName;
  String _userName = '';

  /// Whether a user has logged in.
  bool get loggedIn => _userName.isNotEmpty;

  final navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get context => navigatorKey.currentContext!;

  /// Logs in a user.
  void login(String userName) {
    _userName = userName;
    notifyListeners();
  }

  /// Logs out the current user.
  void logout() {
    _userName = '';
    notifyListeners();
  }
}