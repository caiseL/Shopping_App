import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FullScreenDialog extends StatelessWidget {
  const FullScreenDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1.0,
        title:
            Text('All Filters', style: Theme.of(context).textTheme.headline4),
        leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.times,
            color: Colors.black,
            size: 22.0,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Sort", style: Theme.of(context).textTheme.headline4),
          ),
          ListTile(
              horizontalTitleGap: 0.0,
              trailing: Icon(Icons.check),
              onTap: () {},
              leading: FaIcon(FontAwesomeIcons.fire),
              title: Text("Most popular (default)",
                  style: Theme.of(context).textTheme.headline5)),
          ListTile(
              horizontalTitleGap: 0.0,
              trailing: null,
              onTap: () {},
              leading: FaIcon(FontAwesomeIcons.solidStar),
              title:
                  Text("Rating", style: Theme.of(context).textTheme.headline5)),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Price range",
                style: Theme.of(context).textTheme.headline4),
          ),
        ],
      ),
    );
  }
}
