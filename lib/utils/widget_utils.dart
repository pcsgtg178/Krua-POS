
import 'package:flutter/material.dart';
import 'package:krua_pos/widgets/splash_loading.dart';

Future<T> waitLoading<T>({
  required BuildContext context,
  required Future<T> Function() fun,
}) async {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => SplashLoading(),
  );

  overlay.insert(overlayEntry);

  T result;
  try {
    result = await fun();
  } finally {
    overlayEntry.remove();
  }

  return result;
}