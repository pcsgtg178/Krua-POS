import 'package:go_router/go_router.dart';
import 'package:krua_pos/screens/master_data/menu_items_screen/menu_items_screen.dart';
import 'package:krua_pos/screens/master_data/tables_screen/tables_screen.dart';

final routes = [
  GoRoute(
    path: 'menu-items',
    builder: (context, state) => const MenuItemsScreen()
  ),
  GoRoute(
    path: 'tables',
    builder: (context, state) => const TablesScreen()
  ),
];