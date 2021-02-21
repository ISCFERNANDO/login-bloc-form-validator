import 'dart:async';

import 'package:login_bloc/src/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Stream<bool> get isValidFormStream =>
      Observable.combineLatest2(emailStream, passwordStream, (e, p) => true);

  String get email => _emailController.value;
  String get password => _passwordController.value;

  disponse() {
    _emailController?.close();
    _passwordController?.close();
  }
}
