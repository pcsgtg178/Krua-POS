import 'package:go_router/go_router.dart';
import 'package:krua_pos/screens/master_data/menu_items/menu_items_screen.dart';

final routes = [
  GoRoute(
    path: 'product-data',
    builder: (context, state) => const ProductDataScreen()
  ),
];