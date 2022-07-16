import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shakespear_app/Login_routes/auth_services.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
          ),
          // BUTTON

          ElevatedButton(
            onPressed: () {
              authService.createUserWithEmailAndPassword(emailController.text, passwordController.text);
              Navigator.pushNamed(context, '/');
            },
            child: Text("Register"),
          ),
        ],
      ),
    );
  }
}
