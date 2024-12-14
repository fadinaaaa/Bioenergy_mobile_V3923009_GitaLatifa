import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Register Page'),
            TextField(
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}