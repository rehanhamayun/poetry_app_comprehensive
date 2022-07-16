import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shakespear_app/Login_routes/auth_services.dart';
import 'package:shakespear_app/Login_routes/home_screen.dart';
import 'package:shakespear_app/Login_routes/login.dart';
import 'package:shakespear_app/Login_routes/user_model.dart';
import 'package:shakespear_app/View/home_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,

        builder: (context, AsyncSnapshot<User?> snapshot){
        if(snapshot.connectionState== ConnectionState.active){
          final User? user = snapshot.data;
          return user== null ? Login() : HomePage();
        }
        else{
          return Scaffold(body: Center(
            child: CircularProgressIndicator(),
          ),
          );
        }

        });
  }
}
