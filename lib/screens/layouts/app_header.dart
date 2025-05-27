import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  AppHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }
}