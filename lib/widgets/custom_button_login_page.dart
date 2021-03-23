import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomButtonLoginPage extends StatelessWidget {
  const CustomButtonLoginPage(
      {Key key, @required this.text, @required this.onPressed})
      : super(key: key);

  final Function onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: size.height * 0.04, bottom: size.height * 0.02),
          child: Container(
            height: size.height * 0.065,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                primary: Theme.of(context).accentColor, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: onPressed,
              child: Text(text),
            ),
          ),
        ),
        Container(
          height: size.height * 0.065,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              primary: Theme.of(context).focusColor, // background
              onPrimary: Colors.white, // foreground
            ),
            onPressed: () {},
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              FaIcon(
                FontAwesomeIcons.facebookSquare,
                size: 22.0,
                color: Colors.blue[800],
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "Connect with facebook",
                style: TextStyle(color: Colors.blue[800], fontSize: 18.0),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
