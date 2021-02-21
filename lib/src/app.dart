import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/provider.dart';
import 'package:login_bloc/src/screens/home_screen.dart';
import 'package:login_bloc/src/screens/login_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Login Bloc',
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.routeName,
        routes: {
          LoginScreen.routeName: (_) => LoginScreen(),
          HomeScreen.routeName: (_) => HomeScreen(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
