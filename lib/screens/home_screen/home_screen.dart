import 'package:flutter/material.dart';
import 'package:krua_pos/models/providers/authentication.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello, ${context.read<Authentication>().userName}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<Authentication>().logout();
              },
              child: Text('Logut', style: TextStyle(fontSize: 18, color: Colors.grey),)
            ),
          ],
        ),
      ),
    );
  }
}