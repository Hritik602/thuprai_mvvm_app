import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sign in "),
            const TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Click"))
          ],
        ),
      ),
    );
  }
}
