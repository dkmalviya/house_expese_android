import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myhouse/app/animation/FadeAnimation.dart';
import 'package:myhouse/app/services/UserService.dart';
import 'package:myhouse/app/services/ValidatorService.dart';
import 'package:myhouse/app/utils/ui_utils.dart';
import 'package:myhouse/app/utils/utils.dart';
import 'package:myhouse/app/widgets/AlertBox.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  UserService userService = UserService();
  ValidateService validateService = ValidateService();

  HashMap userValues = new HashMap<String, String>();

  final _signUpFormKey = GlobalKey<FormState>();

  void registerUser()async{
    _signUpFormKey.currentState.save();
    await userService.signup(userValues);
    int statusCode = userService.statusCode;
    if (statusCode == 400) {
      AlertBox alertBox = AlertBox(userService.msg);
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return alertBox.build(context);
          });
    } else {
      Navigator.pushReplacementNamed(context, '/');
    }

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: linearGrayGradient,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight:Radius.circular(25)),

                    boxShadow: [
                      BoxShadow(
                        color: hexToColor("#000000"),
                        offset: Offset(0.0, 5.0), //(x,y)
                        blurRadius: 8.0,
                      ),
                    ],

                  ),


                  child: Stack(
                    alignment:Alignment.center ,
                    children: <Widget>[


                      Positioned(
                        child: FadeAnimation(1.6, Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Center(
                            child: Text("House Expense App", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),),
                          ),
                        )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 40,),
                      FadeAnimation(1.8, Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Form(
                          key: _signUpFormKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                ),
                                child: TextFormField(

                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Name",
                                      hintStyle: TextStyle(color: Colors.grey[400])
                                  ),
                                  initialValue: "Deepesh Malviya",
                                  validator: (value) =>
                                      validateService.validateName(value),
                                  onSaved: (String val) {
                                    userValues['fullName'] = val;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.grey[400])
                                  ),
                                    initialValue: "deepeshmalviya@outlook.com",

                                    validator: (value) =>
                                        validateService.validateEmail(value),
                                    onSaved: (String val) {
                                      userValues['email'] = val;
                                    }
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Mobile Number",
                                      hintStyle: TextStyle(color: Colors.grey[400])
                                  ),
                                    initialValue: "7774043339",

                                    validator: (value) =>
                                        validateService.validatePhoneNumber(value),
                                    onSaved: (String val) {
                                      userValues['mobileNumber'] = val;
                                    }
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                ),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",

                                      hintStyle: TextStyle(color: Colors.grey[400])
                                  ),
                                    initialValue: "Dkumar@123",

                                    validator: (value) =>
                                        validateService.validatePassword(value),
                                    onSaved: (String val) {
                                      userValues['password'] = val;
                                    }
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Re-type Password",

                                      hintStyle: TextStyle(color: Colors.grey[400])
                                  ),

                                  initialValue: "Dkumar@123",

                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                      SizedBox(height: 30,),
                      FadeAnimation(2, InkWell(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(10),
                            gradient: linearGrayGradient,
                            boxShadow: [

                              BoxShadow( offset: Offset(0, 3),
                                color: Colors.grey,
                                spreadRadius: 2.0,
                                blurRadius: 2.0,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text("Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),
                        onTap: (){
                          registerUser();
                        },
                      )),
                      SizedBox(height: 70,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeAnimation(1.5,
                              _signInButton()
                          ),

                        ],
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        )

    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: hexToColor('#18334B')),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(FontAwesomeIcons.google, size: 35,color: hexToColor('#18334B'),),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: hexToColor('#18334B'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


