import 'package:go_router/go_router.dart';
import 'package:krua_pos/models/receipt.dart';
import 'package:krua_pos/screens/payment_screen/payment_screen.dart';
import 'package:krua_pos/screens/sale_screen/sale_screen.dart';

final routes = [
  GoRoute(
    path: 'sale',
    builder: (context, state) => const SaleScreen(),
    routes: [
      GoRoute(
        path: 'payment',
        builder: (context, state) {
            final receipt = state.extra as Receipt?;
            if (receipt == null) {
              throw Exception('receipt is missing in PaymentScreen');
            }
            return PaymentScreen(receipt: receipt);
          },
      )
    ]
  )
];