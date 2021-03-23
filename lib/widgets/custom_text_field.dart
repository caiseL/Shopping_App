import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key key,
      @required this.labelText,
      @required this.icon,
      @required this.isPassword,
      this.onChanged,
      this.errorText,
      this.counterText,
      this.keyboardType})
      : super(key: key);

  final String labelText;
  final IconData icon;
  final bool isPassword;
  final String errorText;
  final String counterText;
  final Function(String) onChanged;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: (size.height * 0.01)),
      child: TextField(
        keyboardType: keyboardType,
        onChanged: onChanged,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          errorText: errorText,
          counterText: counterText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
          prefixIcon: Icon(
            icon,
          ),
          labelStyle: TextStyle(color: Colors.grey, fontSize: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
      ),
    );
  }
}
