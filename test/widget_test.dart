// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:krua_pos/main.dart';
import 'package:krua_pos/models/providers/authentication.dart';
import 'package:krua_pos/routing.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // final auth = Authentication();

    // final appRouter = AppRouter(auth);

    // await tester.pumpWidget(
    //   MultiProvider(
    //     providers: [
    //       ChangeNotifierProvider<Authentication>(create: (_) => auth),
    //     ],
    //     child: Application(appRouter: appRouter),
    //   ),
    // );

    // // รอให้ widget ทำงานเสร็จ
    // await tester.pumpAndSettle();
  });
}
