import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shakespear_app/Login_routes/auth_services.dart';
import 'package:shakespear_app/Login_routes/home_screen.dart';
import 'package:shakespear_app/Login_routes/login.dart';
import 'package:shakespear_app/Login_routes/register.dart';
import 'package:shakespear_app/Login_routes/wrapper.dart';
import 'package:shakespear_app/Provider_Controllers/favorite_quote_provider.dart';
import 'package:shakespear_app/Provider_Controllers/provider_saver.dart';
import 'package:shakespear_app/Provider_Controllers/recent_quotes_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ShowLines()),
          ChangeNotifierProvider(create: (_) => RecentQuotesSaver()),
          ChangeNotifierProvider(create: (_) => FavoriteQuoteSaver()),
          Provider(create: (_)=> AuthService()),
        ],

        child: Builder(builder: (BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
            ),
            initialRoute: '/login',
            routes: {
              '/': (context) => Wrapper(),
              '/login': (context) => Login(),
              '/register': (context) => Register(),
            },
          );
        }));
  }
}
