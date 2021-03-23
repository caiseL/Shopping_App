import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {Key key,
      @required this.title,
      this.iconData,
      @required this.onTap,
      this.trailingIcon})
      : super(key: key);

  final String title;
  final IconData iconData;
  final Function() onTap;
  final IconData trailingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        iconData,
        size: 30.0,
        color: Colors.black,
      ),
      title: Text(title, style: Theme.of(context).textTheme.subtitle2),
      trailing: Icon(trailingIcon),
    );
  }
}
