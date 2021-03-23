import 'package:flutter/material.dart';

void showAlert(BuildContext context, Map info) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(info["message"]),
          actions: [
            TextButton(
              child: Text("Ok"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      });
}
