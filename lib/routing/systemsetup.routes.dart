import 'package:go_router/go_router.dart';
import 'package:krua_pos/screens/system_setup/product_item_config/product_item_config.dart';

final routes = [
  GoRoute(
    path: 'product-item-config',
    builder: (context, state) => const ProductItemConfig(),
  )
];