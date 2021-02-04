import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myhouse/app/utils/utils.dart';
class MyAppBar extends StatelessWidget with PreferredSizeWidget{


 // String logoName;
  String title;
  bool isNotificationVisible;
  bool isleadingEnable;


  MyAppBar(this.title, this.isNotificationVisible, this.isleadingEnable);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        Visibility(
          visible: isNotificationVisible,
          child: IconButton(
            icon: Icon(FontAwesomeIcons.bell),
            onPressed: () {

            },

          ),
        )
      ],

      elevation: 0,
      backgroundColor: hexToColor("#18334B"),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }
}
