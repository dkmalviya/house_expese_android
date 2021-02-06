import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myhouse/app/animation/FadeAnimation.dart';
import 'package:myhouse/app/constant/AppConstant.dart';
import 'package:myhouse/app/services/ProfileService.dart';
import 'package:myhouse/app/services/UserService.dart';
import 'package:myhouse/app/services/ValidatorService.dart';
import 'package:myhouse/app/utils/SharedPreferenceUtils.dart';
import 'package:myhouse/app/utils/ui_utils.dart';
import 'package:myhouse/app/utils/utils.dart';
import 'package:myhouse/app/widgets/AlertBox.dart';
import 'package:myhouse/app/widgets/ProgressLoader.dart';
import 'package:myhouse/main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  HashMap userValues = new HashMap<String, String>();
  SharedPreferenceUtils _sharedPreferenceUtils=SharedPreferenceUtils();

  ValidateService _validateService = ValidateService();
  UserService _userService = UserService();
  ProfileService _profileService = ProfileService();

  void doLogin()async{


      if(this._formKey.currentState.validate()){
        _formKey.currentState.save();
        ProgressLoader.showLoadingScreen(context, _keyLoader);
        await _userService.login(userValues);

        int statusCode = _userService.statusCode;
        if(statusCode == 200){
          Map map=await _profileService.getUserProfile();

MyApp.userInfoModel.userId=map["userId"];
MyApp.userInfoModel.fullName=map["fullName"];
MyApp.userInfoModel.email=map["email"];
MyApp.userInfoModel.mobileNumber=map["mobileNumber"];
MyApp.userInfoModel.currentHouseId=map["currentHouseId"];
MyApp.userInfoModel.isOwnerOfHouse=map["isOwnerOfHouse"];

          _sharedPreferenceUtils.saveEncryptedValues(KEY_USER_INFO, MyApp.userInfoModel);


          Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
          Navigator.pushNamed(context, '/home');
        }
        else{
          Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
          AlertBox alertBox = AlertBox(_userService.msg);
          return showDialog(
              context: context,
              builder: (BuildContext context){
                return alertBox.build(context);
              }
          );
        }
      }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 300,
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
                        width: 120,
                        bottom: 50,
                        child: FadeAnimation(2, Container(

                            child: CircleAvatar(
                              child: Container(

                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color:Colors.white
                                    ),
                                    const BoxShadow(
                                      color: Colors.black87,
                                      spreadRadius: 5.0,
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                              ),
                              radius: 120,
                            )
                        )),
                      ),
                      Positioned(
                        top: 110,

                        child: FadeAnimation(2, Container(
                            child: Icon(FontAwesomeIcons.rupeeSign,size:40,color:  hexToColor('#395E7E'),)
                        )),
                      ),

                      Positioned(
                        child: FadeAnimation(1.6, Container(
                          margin: EdgeInsets.only(top: 200),
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
                            key: _formKey,
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
                                      hintText: "Email or Phone number",
                                      hintStyle: TextStyle(color: Colors.grey[400])
                                  ),
                                  initialValue: "deepeshmalviya@outlook.com",
                                  validator: (value)=> _validateService.isEmptyField(value),
                                  keyboardType: TextInputType.emailAddress,
                                  onSaved: (String val){
                                    userValues['email'] = val;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",

                                      hintStyle: TextStyle(color: Colors.grey[400])
                                  ),
                                    initialValue:"Dkumar@123",
                                  validator: (value) => _validateService.isEmptyField(value),
                                  onSaved: (String val){
                                    userValues['password'] = val;
                                  },
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
                            child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),
                        onTap: (){
                          doLogin();
                        },
                      )),
                      SizedBox(height: 40,),
                      FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color:  hexToColor('#18334B')),)),
                      SizedBox(height: 70,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FadeAnimation(1.5, Text("Don't have an account?", style: TextStyle(color:  hexToColor('#18334B')),)),
                          InkWell(child: FadeAnimation(1.5, Text("Sign up !", style: TextStyle(color:Colors.redAccent),)
                          ),
                            onTap: (){
                            Navigator.of(context).pushNamed("/registration");
                            },
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
}

