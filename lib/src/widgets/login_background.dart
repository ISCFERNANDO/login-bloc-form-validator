import 'package:flutter/material.dart';

class LoginBackgroundWidget extends StatelessWidget {
  const LoginBackgroundWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return _buildFondoMorado(size);
  }

  _buildFondoMorado(Size size) {
    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.person_pin_circle,
            color: Colors.white,
            size: 100.0,
          ),
          SizedBox(height: 10),
          Text(
            'Welcome!!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Colors.white.withOpacity(0.05),
      ),
    );
    return Stack(
      children: [
        fondoMorado,
        Positioned(top: 70, left: 25, child: circulo),
        Positioned(top: -40, right: -40, child: circulo),
        Positioned(bottom: -60, right: 10, child: circulo),
      ],
    );
  }
}
