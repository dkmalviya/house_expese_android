/*
import 'package:bre/app/utils/utils.dart';
import 'package:bre/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class OTPAlertDialog {
  String status;
  String customerName;
  String productName;

  BreAlertDialogOTP(this.status,this.swipetoDealId,this.customerName,this.productName);

  showAlertDialog(BuildContext context) {

    final alert = AlertDialog(
      backgroundColor: hexToColor("#404040"),
      title: Center(child: Text(AppLocalizations.of(context).tnx_status_lbl_screen_title,style: TextStyle(fontSize: 18,color: Colors.white),),),
      content: Container(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: Column(
                children: [

                  SizedBox(height: 4),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Divider(
                            color: Colors.white,
                            thickness: 1,
                            indent: 5.0,
                            endIndent: 5.0,
                          )),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(

                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(flex: 5,child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                8.0, 6, 8.0, 6),
                            child: Text(
                              AppLocalizations.of(context).tnx_lbl_customer_name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      )),
                      Expanded(flex: 5,child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                5.0, 6, 5.0, 6),
                            child: Text(
                              customerName,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ],
                      ),),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Divider(
                            color: Colors.white,
                            thickness: 1,
                            indent: 5.0,
                            endIndent: 5.0,
                          )),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Expanded(flex: 5,child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                8.0, 6, 8.0, 6),
                            child: Text(
                              productName,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ],
                      ),),

                      Expanded(flex: 5,child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                5.0, 6, 5.0, 6),
                            child: Text(
                              status,
                              maxLines: 4,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),),

                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Divider(
                            color: Colors.white,
                            thickness: 1,
                            indent: 5.0,
                            endIndent: 5.0,
                          )),
                    ],
                  ),
                  SizedBox(height: 20),
                  FlatButton(
                    child: Text('OK',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    onPressed: () {
                      debugPrint("swipetoDealId" + swipetoDealId);
                      if(swipetoDealId !='' && swipetoDealId != null && swipetoDealId.isNotEmpty){
                        print("kk"+ swipetoDealId);

                        Navigator.of(context).pushNamedAndRemoveUntil('/customer_search', (Route<dynamic> route) => false);

                      }else{
                        print("ss"+swipetoDealId);
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        //okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );

  }
}*/
