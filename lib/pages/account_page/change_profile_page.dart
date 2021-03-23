import 'package:flutter/material.dart';

class ChangeProfilePage extends StatelessWidget {
  const ChangeProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Nombre:"),
        Container(
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(20.0)),
        )
      ],
    ));
  }
}
