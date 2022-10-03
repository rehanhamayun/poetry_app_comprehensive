import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shakespear_app/Login_routes/auth_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You're in the HOME Screen"),
          Center(
            child: ElevatedButton(
              onPressed: () {
                authService.signOut();

              },
              child: const Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }
}
