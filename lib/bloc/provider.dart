import 'package:flutter/material.dart';
import 'package:shopping_app_firebase/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  static Provider _instance;

  factory Provider({Key key, Widget child}) {
    if (_instance == null) {
      _instance = new Provider._internal(key: key, child: child);
    }

    return _instance;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  final loginBloc = LoginBloc();

  // Provider({ Key key, Widget child })
  //   : super(key: key, child: child );

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>()).loginBloc;
  }
}
