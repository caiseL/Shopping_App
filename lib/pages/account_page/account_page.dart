import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app_firebase/widgets/custom_list_tile.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_outlined),
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.020,
          ),
          Center(
            child: CircleAvatar(
                radius: size.height * 0.075,
                backgroundColor: Theme.of(context).hintColor,
                backgroundImage: NetworkImage(
                  "https://media.gq.com.mx/photos/5f23041351bcbdbc95b13466/master/pass/JEFF.jpg",
                )),
          ),
          Text("Jeff Preston Bezos",
              style: Theme.of(context).textTheme.headline3),
          Text("jeffbezos@gmail.com",
              style: TextStyle(fontSize: 16.0, color: Colors.grey)),
          SizedBox(
            height: size.height * 0.03,
          ),
          Divider(
            color: Colors.grey,
          ),
          CustomListTile(
            title: "Change your profile",
            iconData: Icons.person,
            onTap: () =>
                Navigator.of(context).pushNamed("account/change_profile"),
          ),
          CustomListTile(
            title: "Payment",
            iconData: Icons.credit_card,
            onTap: () {},
          ),
          CustomListTile(
            title: "Deliveries",
            iconData: FontAwesomeIcons.truck,
            onTap: () {},
          ),
          CustomListTile(
            title: "Add some shit",
            onTap: () => Navigator.of(context).pushNamed("add_products_page"),
            iconData: Icons.add,
          )
        ],
      ),
    ));
  }
}
