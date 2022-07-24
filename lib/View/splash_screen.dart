import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shakespear_app/Login_routes/login.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 2000),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Login(),
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:Image.asset("assets/images/shake.png"),
    );
  }
}