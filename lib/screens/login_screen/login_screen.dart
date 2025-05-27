import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:krua_pos/widgets/splash_loading.dart';
import 'package:krua_pos/services/authentication.dart';
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

    TextEditingController userCtrl = TextEditingController();
    TextEditingController passCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login Screen")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: userCtrl,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passCtrl,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async  {
                if (userCtrl.text.isEmpty) return;
                await waitLoading(context: context, fun: () async { await Future.delayed(const Duration(seconds: 1)); });
                
                Authentication.instance.login(userCtrl.text);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}