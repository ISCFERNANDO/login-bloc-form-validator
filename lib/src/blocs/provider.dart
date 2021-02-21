import 'package:flutter/material.dart';

import 'login_bloc.dart';

class Provider extends InheritedWidget {
  static Provider _instance;

  final loginBloc = LoginBloc();

  factory Provider({Key key, Widget child}) {
    if (_instance == null) {
      _instance = Provider._(key: key, child: child);
    }
    return _instance;
  }

  Provider._({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>()).loginBloc;
  }
}
