import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_list_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).accentColor),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.person_outline,
                      size: 30.0,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 9,
                    child: Text(
                      "Hello, Jeff Bezos",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                          fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomListTile(
            title: "Home",
            iconData: Icons.home,
            onTap: () => Navigator.of(context)
                .pushNamedAndRemoveUntil("/", (route) => false),
          ),
          CustomListTile(
            title: "Account",
            iconData: Icons.person,
            onTap: () => Navigator.of(context).pushNamed("account"),
          ),
          CustomListTile(
            title: "Categories",
            iconData: FontAwesomeIcons.tshirt,
            onTap: () => Navigator.of(context).pushNamed("categories"),
            trailingIcon: Icons.keyboard_arrow_right,
          ),
          CustomListTile(
            title: "Your favorites",
            iconData: FontAwesomeIcons.solidHeart,
            onTap: () {},
          ),
          CustomListTile(
            title: "Settings",
            iconData: Icons.settings,
            onTap: () => Navigator.of(context).pushNamed("settings_page"),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              "About",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                  color: Colors.black),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
    );
  }
}
