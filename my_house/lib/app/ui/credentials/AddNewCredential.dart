
import 'package:flutter/material.dart';
import 'package:myhouse/app/constant/AppConstant.dart';
import 'package:myhouse/app/models/PasswordParser.dart';
import 'package:myhouse/app/utils/SharedPreferenceUtils.dart';
import 'package:myhouse/app/utils/utils.dart';
import 'package:myhouse/app/widgets/HouseAlertDialog.dart';
import 'package:myhouse/app/widgets/MyAppBar.dart';

class AddNewCredential extends StatefulWidget {

  @override
  _AddNewCredentialState createState() => _AddNewCredentialState();
}

class _AddNewCredentialState extends State<AddNewCredential> {

  String _selectedAccountCategory;
  List<String> _accountCategory = ["Banking","Social","Personal","Professional"];
  List<DropdownMenuItem<String>> _dropdownMenuSourceItems;

  TextEditingController accountCategoryTextController = TextEditingController();
  TextEditingController accountTextController = TextEditingController();
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();


  SharedPreferenceUtils _sharedPreferenceUtils=SharedPreferenceUtils();


  List<PasswordParser> passwordList;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dropdownMenuSourceItems=buildDropdownMenuItems(_accountCategory);
  }

  @override
  Widget build(BuildContext context) {

    final incomeSourceSelector=Container(


      child: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: hexToColor('#18334B'),
        ),
        child: DropdownButtonFormField(
          style: new TextStyle(color: Colors.white, fontSize: 16),
          isExpanded: true,

          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(8.0, 1.8, 8.0, 1.8),
            filled: true,
            fillColor: hexToColor('#18334B'),
            hintText: "Select Income Source",
            hintStyle: TextStyle(color: Colors.grey),

          ),
          value: _selectedAccountCategory,
          items: _dropdownMenuSourceItems,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          iconSize: 24,
          onChanged: OnChangeDropdownSourceItem,
        ),
      ),
    );


    final accountName=Container(
      child: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: hexToColor('#18334B'),
        ),
        child: TextFormField(
          style: new TextStyle(color: Colors.white, fontSize: 16),
          controller: accountTextController,

          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(8.0, 1.8, 8.0, 1.8),
            filled: true,
            hintText: "Enter account name",
            hintStyle: TextStyle(color: Colors.grey),
            fillColor: hexToColor('#18334B'),
          ),
        ),
      ),
    );

    final userName=Container(
      child: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: hexToColor('#18334B'),
        ),
        child: TextFormField(
          controller: usernameTextController,

          style: new TextStyle(color: Colors.white, fontSize: 16),

          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(8.0, 1.8, 8.0, 1.8),
            filled: true,
            hintText: "Enter username here",
            hintStyle: TextStyle(color: Colors.grey),
            fillColor: hexToColor('#18334B'),
          ),
        ),
      ),
    );


    final password=Container(
      child: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: hexToColor('#18334B'),
        ),
        child: TextFormField(
          controller: passwordTextController,

          style: new TextStyle(color: Colors.white, fontSize: 16),

          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(8.0, 1.8, 8.0, 1.8),
            filled: true,
            hintText: "Enter password here",
            hintStyle: TextStyle(color: Colors.grey),
            fillColor: hexToColor('#18334B'),
          ),
        ),
      ),
    );
    final passwordConfirm=Container(
      child: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: hexToColor('#18334B'),
        ),
        child: TextFormField(
          style: new TextStyle(color: Colors.white, fontSize: 16),
          controller: confirmPasswordTextController,

          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(8.0, 1.8, 8.0, 1.8),
            filled: true,
            hintText: "Confirm password here",
            hintStyle: TextStyle(color: Colors.grey),
            fillColor: hexToColor('#18334B'),
          ),
        ),
      ),
    );




    return Scaffold(
      appBar:MyAppBar("Add New Credential",false,false),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Column(
          children: <Widget>[

            incomeSourceSelector,
            SizedBox(height: 20,),
            accountName,
            SizedBox(height: 20,),
            userName,
            SizedBox(height: 20,),
            password,
            SizedBox(height: 20,),
            passwordConfirm,
            SizedBox(height: 40,),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 140,
                  child: RaisedButton(
                    onPressed: (){
                      validateAndSaveAccountCredentails();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Save",style: TextStyle(color: Colors.white,fontSize: 18),),
                    ),
                    elevation: 10,
                    color:  hexToColor('#18334B'),
                  ),
                ),
                Container(
                  width: 140,
                  child: RaisedButton(
                      onPressed: (){
                        clearAllValue();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("Clear",style: TextStyle(color: Colors.white,fontSize: 18),),
                      ),
                      elevation: 10,
                      color:  Colors.red[900]
                  ),
                )
              ],
            )
          ],
        ),



      ),


    );
  }

  List<DropdownMenuItem<String>> buildDropdownMenuItems(
      List searchSources) {
    List<DropdownMenuItem<String>> items = List();
    for (String source in searchSources) {
      items.add(
        DropdownMenuItem(
          value: source,
          child: Text(source),
        ),
      );
    }
    return items;
  }


  OnChangeDropdownSourceItem(String selectSource) {
    setState(() {
      _selectedAccountCategory = selectSource;
      accountCategoryTextController.text=selectSource;

    });
  }

  Future<void> validateAndSaveAccountCredentails() async {
    if(confirmPasswordTextController.text==passwordTextController.text){
      PasswordParser model=PasswordParser();
      model.userName=usernameTextController.text;
      model.encryptedPassword=encryptString(passwordTextController.text, "password");
      model.accountName=accountTextController.text;
      model.accountCategory=accountCategoryTextController.text;
      final temp=await _sharedPreferenceUtils.readEncryptedValues(KEY_PASSWORD_LIST);

      if (temp == null) {
        passwordList=List();
      }
      else{
        passwordList=passwordParserFromJson(temp);
      }
      passwordList.add(model);
      _sharedPreferenceUtils.saveEncryptedValues(KEY_PASSWORD_LIST, passwordList);

      HouseAlertDialog("Success","Password Added Successfully","OK").showAlertDialog(context);


    }
    else{
      HouseAlertDialog("Alert","Password does not match","OK").showAlertDialog(context);

      //Show Alert Password not matched
    }


  }

  void clearAllValue() {
    confirmPasswordTextController.text="";
    passwordTextController.text="";
    accountTextController.text="";
    usernameTextController.text="";
  }
}
