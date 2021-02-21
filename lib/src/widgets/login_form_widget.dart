import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/login_bloc.dart';
import 'package:login_bloc/src/blocs/provider.dart';

class LoginFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: size.height * 0.30,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 24.0),
            padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 2.0),
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Text('Ingreso', style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 40.0),
                _crearEmail(bloc),
                SizedBox(height: 20.0),
                _crearPassword(bloc),
                SizedBox(height: 20.0),
                _crearBoton(bloc),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Text('¿Olvidó su contraseña?', style: TextStyle(fontSize: 16)),
          //SizedBox(height: 50.0),
        ],
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.emailStream,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
            hintText: 'ejemplo@gmail.com',
            labelText: 'Correo electrónico',
            errorText: snapshot.error,
          ),
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.passwordStream,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock_outline, color: Colors.deepPurple),
            labelText: 'Contraseña',
            errorText: snapshot.error,
          ),
          onChanged: bloc.changePassword,
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc) {
    return StreamBuilder<bool>(
      stream: bloc.isValidFormStream,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
            child: Text('Iniciar sesión'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 0,
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
        );
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) {
    Navigator.pushReplacementNamed(context, 'home');
  }
}
