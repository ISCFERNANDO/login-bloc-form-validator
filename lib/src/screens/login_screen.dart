import 'package:flutter/material.dart';
import 'package:login_bloc/src/widgets/login_background.dart';
import 'package:login_bloc/src/widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  static final String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LoginBackgroundWidget(),
          LoginFormWidget(),
        ],
      ),
    );
  }
}
