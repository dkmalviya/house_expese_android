import 'package:flutter/material.dart';

import 'app/route/RouteGenerator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        title: 'My House',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
        //home: PreLoginScreen(),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute);
  }

}
