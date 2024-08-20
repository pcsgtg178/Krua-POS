import 'package:flutter/material.dart';

class SplashLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        // Fade background
        Opacity(
          opacity: 0.5,
          child: ModalBarrier(
            dismissible: false,
            color: Colors.black,
          ),
        ),
        // Loading spinner
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}