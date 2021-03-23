import 'package:flutter/material.dart';
import 'package:shopping_app_firebase/widgets/custom_list_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomListTile(
              title: "Notifications",
              onTap: () {},
              iconData: Icons.notifications,
            ),
          ],
        ),
      ),
    );
  }
}
