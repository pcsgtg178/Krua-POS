import 'package:go_router/go_router.dart';
import 'package:krua_pos/screens/system_setup/list_of_value/list_of_value_screen.dart';
import 'package:krua_pos/screens/system_setup/user_management/user_management_screen.dart';

final routes = [
  GoRoute(
    path: 'user-management',
    builder: (context, state) => const UserManagementScreen()
  ),
  GoRoute(
    path: 'lov',
    builder: (context, state) => const ListOfValueScreen()
  ),
];