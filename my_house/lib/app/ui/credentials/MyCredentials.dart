import 'dart:convert';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myhouse/app/constant/AppConstant.dart';
import 'package:myhouse/app/constant/data.dart';
import 'package:myhouse/app/models/ExpenseCategoryModel.dart';
import 'package:myhouse/app/models/PasswordParser.dart';
import 'package:myhouse/app/utils/SharedPreferenceUtils.dart';
import 'package:myhouse/app/utils/utils.dart';
import 'package:myhouse/app/widgets/HouseAlertDialog.dart';
import 'package:myhouse/app/widgets/MyAppBar.dart';
class MyCredentials extends StatefulWidget {

  @override
  _MyCredentialsState createState() => _MyCredentialsState();
}

class _MyCredentialsState extends State<MyCredentials> {

  static Set<PasswordParser>_filteredPasswordList = Set();
  static Set<PasswordParser>myPasswordList = Set();

  static PasswordParser selectedAccount;

  SharedPreferenceUtils _sharedPreferenceUtils=SharedPreferenceUtils();

  TextEditingController masterPasswordController=TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readPasswords();
  }


  Future<void> readPasswords() async {
    final temp = await _sharedPreferenceUtils.readEncryptedValues(
        KEY_PASSWORD_LIST);


    if(temp!=null){
      List tempList = passwordParserFromJson(temp);
      if (tempList != null) {
        for (var passwordParser in tempList) {
          setState(() {
            myPasswordList.add(passwordParser);
            _filteredPasswordList.add(passwordParser);
          });
        }
      }
    }

  }


  @override
  Widget build(BuildContext context) {

    Widget leadingImage(String value) {
      for (var testModel in accountImages){
        if(testModel['accountName'].toString().toLowerCase() == value.toLowerCase()){
          return  Image(
            image: AssetImage(testModel['image']),
          );
        }
      }
      return Image(
        image: AssetImage("assets/images/accounts/work.png"),
      );
    }

    final searchBox=TextFormField(

        style: new TextStyle(color: Colors.white, fontSize: 16),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 14,horizontal: 20),
          hintText: "Enter account name",
          hintStyle: TextStyle(color: Colors.white30),
          suffixIcon: IconButton(
            onPressed: () {
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            color: Colors.transparent,
          ),
        ),
        onChanged: (string) {
          setState(() {
            _filteredPasswordList=myPasswordList.where((element) => (element.accountName.toLowerCase().contains(string.toLowerCase()))).toSet();
          });
        }
    );


    return Scaffold(

      appBar: MyAppBar("Credentials", false, false),
      body:Container(
        color: hexToColor("#CADCED"),
        width: MediaQuery
            .of(context)
            .size
            .width,

        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: hexToColor("#B5AAE1"),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        hexToColor('#395E7E'),
                        hexToColor('#18334B'),
                        hexToColor('#18334B'),
                      ]
                  ),
                  boxShadow: customDarkShadow

              ),
              child: Container(
                margin: EdgeInsets.all(15),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        hexToColor('#18334B'),
                        hexToColor('#395E7E'),
                        //hexToColor('#A5FECB'),
                      ]
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: hexToColor("#000000"),
                      offset: Offset(0.0, 5.0), //(x,y)
                      blurRadius: 8.0,
                    ),
                  ],
                ),

                child: Column(
                  children: <Widget>[
                    Container(
                      child:searchBox,
                    ),

                  ],
                ),
              ),
            ),//End Of Search Box

            SizedBox(height: 5,),



            Container(
              //   padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: ListTile(
                leading:Icon(FontAwesomeIcons.key,color: hexToColor('#18334B'),),
                title: Align(
                  alignment: Alignment(-1.2, 0),
                  child: Text(
                    "My Credentials"
                    ,style: TextStyle(
                    fontSize: 20,
                  ),
                    textAlign: TextAlign.left,
                  ),
                ),


                trailing: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: hexToColor('#18334B'),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed("/add_password");
                        },
                        child: Icon(FontAwesomeIcons.plus,color: Colors.white,)
                    )
                ),
              ),
            ),

            Expanded(

              child: ListView.builder(
                  cacheExtent: 256,
                  padding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
                  itemCount: _filteredPasswordList.length,
                  itemBuilder: (BuildContext context,int index){
                    return Card(
                      child:ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 15),

                        leading: leadingImage(_filteredPasswordList.elementAt(index).accountName),
                        title: Padding(padding:EdgeInsets.only(top: 2),child:Text(
                          _filteredPasswordList.elementAt(index).accountName,
                          style: TextStyle(fontSize: 18,fontWeight:FontWeight.w600,color: Colors.black),
                        ),),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(padding:EdgeInsets.only(top: 3,bottom: 2),child: Text('User Name : ' + _filteredPasswordList.elementAt(index).userName,
                              style: TextStyle(fontSize: 15,color:Colors.black,),
                            ),),

                            Padding(padding:EdgeInsets.only(top: 3,bottom: 2),child: Text('Category : ' + _filteredPasswordList.elementAt(index).accountCategory,
                              style: TextStyle(fontSize: 15,color:Colors.black,),
                            ),),
                          ],
                        ),

                        trailing: Icon(
                          Icons.delete_forever,
                          size: 32,
                          color: Colors.red[200],
                        ),
                        onLongPress: (){

                          selectedAccount=_filteredPasswordList.elementAt(index);
                          //Show OTP ALERT
                          _showDialog();
                        },
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }

  _showDialog() async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      child: new _SystemPadding(child: new AlertDialog(
        title: Text("Enter Pin"),

        contentPadding: const EdgeInsets.all(16.0),
        content: new Row(
          children: <Widget>[
            new Expanded(
              child: new TextField(
                controller: masterPasswordController,
                autofocus: true,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 6,
                style: TextStyle(
                  letterSpacing: 6,
                  fontWeight: FontWeight.bold,
                  color: hexToColor('#0267aa'),
                ),

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 1.5, bottom: 1.5),
                  hintStyle: TextStyle(color: hexToColor('#0267aa')),
                  counterText: "",
                  fillColor: Colors.transparent,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: hexToColor('#0267aa'), width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: hexToColor('#0267aa'), width: 2),
                  ),
                ),
              ),
            )
          ],
        ),
        actions: <Widget>[
          new FlatButton(
              child: const Text('Verify'),
              onPressed: () {

                print(masterPasswordController.text);

                FocusScope.of(context).unfocus();

                if(masterPasswordController.text.length==6){
                  validatePin(masterPasswordController.text);
                  Navigator.pop(context);
                }
                else{
                  Navigator.pop(context);
                  HouseAlertDialog("Alert","Invalid Password","Ok").showAlertDialog(context);
                  //BreToast().showToast(AppLocalizations.of(context).rs_msg_otp_validation);
                }

              }),
          new FlatButton(
              child: const Text('Cancel'),
              onPressed: () {
                FocusScope.of(context).unfocus();
                Navigator.pop(context);
              })
        ],
      ),),
    );
  }

  Future<void> validatePin(String pin) async {
    //TEMP Save Master Passowrd;
    String masterPasswordPin = "140391";
    String encrypterPassword = encryptString(masterPasswordPin, "pin");
    _sharedPreferenceUtils.saveEncryptedValues(
        KEY_PASSWORD_PIN, encrypterPassword);

    //read masterpassword
    final temp = await _sharedPreferenceUtils.readEncryptedValues(
        KEY_PASSWORD_PIN);
    if (temp == null) {
      HouseAlertDialog("Alert", "Master Pin not available", "Ok")
          .showAlertDialog(context);
    }
    else {
      final te = json.decode(temp);
      if (pin == decryptString(te, "pin")) {
        print("passwordMatch");
        HouseAlertDialog(selectedAccount.accountName,"UserName : "+selectedAccount.userName+"\nPassword : "+decryptString(selectedAccount.encryptedPassword, "password")+"","Ok").showAlertDialog(context);
      }
      else {
        print("password Not Match");
        HouseAlertDialog("Alert","Invalid Password","Ok").showAlertDialog(context);
      }
    }
  }
}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 300),
        child: child);
  }
}
