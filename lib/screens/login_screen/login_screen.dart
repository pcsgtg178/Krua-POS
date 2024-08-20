import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:krua_pos/common_widgets/splash_loading.dart';
import 'package:krua_pos/models/providers/authentication.dart';
import 'package:krua_pos/utils/widget_utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    TextEditingController _userCtrl = TextEditingController();
    TextEditingController _passCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login Screen")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _userCtrl,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passCtrl,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async  {
                if (_userCtrl.text.isEmpty) return;
                await waitLoading(context: context, fun: () async { await Future.delayed(Duration(seconds: 3)); });
                
                context.read<Authentication>().login(_userCtrl.text);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}