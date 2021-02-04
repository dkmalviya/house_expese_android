
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class HouseAlertDialog {
  String title;
  String message;
  String okButtonTitle;



  HouseAlertDialog(this.title,this.message,this.okButtonTitle);


  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text(okButtonTitle),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );


    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}