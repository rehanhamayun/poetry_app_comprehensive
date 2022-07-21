import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shakespear_app/Login_routes/auth_services.dart';
import 'package:shakespear_app/View/home_page.dart';
import 'package:shakespear_app/configs/configs.dart';
import 'package:sizer/sizer.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/shake.png", height: 30.h, width: 30.w,),

          Padding(
            padding: const EdgeInsets.fromLTRB(20,20,20,0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
          ),
          //
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,20,20,0),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
          ),
          // BUTTON

          SizedBox(height: 30,),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: colorMain,
            ),
            onPressed: () {
              authService.createUserWithEmailAndPassword(emailController.text, passwordController.text);

              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));

            },
            child: Text("Proceed"),
          ),
          // Sign Up

         // ElevatedButton(
          //  onPressed: () {
           //   Navigator.pushNamed(context, '/register');
           // },
         //   child: Text("Register"),
        //  ),
        ],
      ),
    );
  }
}
