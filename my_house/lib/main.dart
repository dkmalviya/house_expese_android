import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myhouse/app/Locator.dart';
import 'package:myhouse/app/models/HouseModel.dart';
import 'package:myhouse/app/models/UserInfoModel.dart';
import 'package:myhouse/app/view_models/IncomeViewModel.dart';
import 'package:provider/provider.dart';

import 'app/route/RouteGenerator.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MyApp()
  );
}
class MyApp extends StatefulWidget {

  static UserInfoModel userInfoModel=UserInfoModel();
  static HouseModel houseModel=HouseModel();
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return
 MaterialApp(

        title: 'My House',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
        //home: PreLoginScreen(),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute
    );
  }

}
