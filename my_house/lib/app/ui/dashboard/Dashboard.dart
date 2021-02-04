import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:myhouse/app/constant/data.dart';
import 'package:myhouse/app/utils/utils.dart';
import 'package:myhouse/app/widgets/ExpenseChartWidget.dart';
import 'package:myhouse/app/widgets/MyAppBar.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'indicator.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int touchedIndex;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:MyAppBar("My House",true,false),


      drawer: Drawer(

        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    hexToColor('#18334B'),
                    hexToColor('#395E7E'),
                    hexToColor('#18334B'),
                  ]
              )
          ),
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(

                accountEmail: Text("deepeshmalviya@outlook.com"),
                accountName: Text("Deepesh Malviya"),
                currentAccountPicture: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Center(
                      child: Image(
                          image: NetworkImage(
                              "https://s3.amazonaws.com/uifaces/faces/twitter/anton0kurilov/128.jpg")
                      ),
                    ),
                  ),
                ),
              ),


              ListTile(
                title: Text("Home",
                  style: TextStyle(
                    color: hexToColor("#FFFFF0"),
                  ),),
                leading: Icon(
                    FontAwesomeIcons.home, color: hexToColor("#FFFFF0")),
                onTap: () {

                },
              ),

              ListTile(
                title: Text("Expense",
                  style: TextStyle(
                    color: hexToColor("#FFFFF0"),
                  ),),
                leading: Icon(
                  FontAwesomeIcons.moneyBill, color: hexToColor("#FFFFF0"),),

                onTap: () {

                },
              ),

              ListTile(
                title: Text("Income",
                  style: TextStyle(
                    color: hexToColor("#FFFFF0"),
                  ),),
                leading: Icon(
                    FontAwesomeIcons.wallet, color: hexToColor("#FFFFF0")),

                onTap: () {

                },
              ),

              ListTile(
                title: Text("Reports",
                  style: TextStyle(
                    color: hexToColor("#FFFFF0"),
                  ),),
                leading: Icon(
                    FontAwesomeIcons.fileAlt, color: hexToColor("#FFFFF0")),

                onTap: () {

                },
              ),

              ListTile(
                title: Text("Favorites",
                  style: TextStyle(
                    color: hexToColor("#FFFFF0"),
                  ),),
                leading: Icon(
                    FontAwesomeIcons.star, color: hexToColor("#FFFFF0")),

                onTap: () {

                },
              ),
              ListTile(
                title: Text("Logout",
                  style: TextStyle(
                    color: hexToColor("#FFFFF0"),
                  ),),
                leading: Icon(
                    FontAwesomeIcons.signOutAlt, color: hexToColor("#FFFFF0")),

                onTap: () {

                },
              ),
            ],
          ),
        ),

      ),


      body: Container(
        color: hexToColor("#CADCED"),
        width: MediaQuery
            .of(context)
            .size
            .width,


        //    height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
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
                  height: 200,
                  decoration: BoxDecoration(

                    gradient: LinearGradient(
                        colors: [
                          hexToColor('#18334B'),
                          hexToColor('#395E7E'),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Current Balance",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),),
                            Text("INR",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),)

                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0),
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.rupeeSign,
                              size: 22,
                              color: Colors.white,),
                            SizedBox(width: 10,),
                            Text("25,000",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),),


                          ],
                        ),
                      ),

                      Divider(
                        color: Colors.white,
                        indent: 15,
                        endIndent: 15,
                      ),

                      Card(
                        elevation: 1,
                        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text("\u20B9 "+"1,00,000.0",style: TextStyle(color: Colors.white,)),
                                  SizedBox(height: 5,),
                                  Text("Income",style: TextStyle(color:  Colors.lightGreenAccent,fontWeight: FontWeight.w300))
                                ],
                              ),

                              Column(
                                children: <Widget>[
                                  Text("\u20B9 "+"75,000.0",style: TextStyle(color: Colors.white)),
                                  SizedBox(height: 5,),
                                  Text("Expense",style: TextStyle(color: Colors.lightGreenAccent,fontWeight: FontWeight.w300))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),


                ),


              ),


              SizedBox(
                height: 20,
              ),

              //Add Buttons

              /*Container(
                child: ExpenseChartWidget(),
              ),
*/

              Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: GridView.count(
                      crossAxisCount: 4,
                      crossAxisSpacing: 6.0,
                      mainAxisSpacing: 8.0,
                      shrinkWrap: true,
                      children: List.generate(8, (index) {
                        return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Card(
                                elevation: 6,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          hexToColor('#18334B'),
                                          hexToColor('#395E7E'),
                                        ]
                                    ),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(4.0),),
                                  ),
                                  child: InkWell(
                                     // inkwell color
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(width: 56, height: 56, child: Icon(dashIcons[index]['icon'],color: Colors.white,)),
                                        Text(
                                            dashIcons[index]['title'],
                                          style:TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                          )
                                        )
                                      ],
                                    ),


                                    onTap: () {



                                        Navigator.of(context).pushNamed(dashIcons[index]['screen']);


                                    },
                                  ),
                                )
                            )
                        );
                      }
                      )
                  )
              ),


              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                alignment: Alignment.topLeft,
                child: Text("Recent Transactions", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),),
              ),


              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  alignment: Alignment.topLeft,
                  child: Container(
                      child: Column(
                        children: <Widget>[
                          Card(

                            child: ListTile(
                              // contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                              leading: CircleAvatar(
                                backgroundColor: hexToColor("#18334B"),

                                child: Text('C', style: TextStyle(fontSize: 20,
                                    fontWeight: FontWeight.w500),),
                                //   child: Icon(FontAwesomeIcons.ad,color: Colors.green,size: 24,),
                              ),
                              title: Text("Salary"),
                              subtitle: Text("Credit"),
                              trailing: Text("\u20B9 40000"),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              // contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                              leading: CircleAvatar(
                                backgroundColor: hexToColor("#18334B"),

                                child: Text('D', style: TextStyle(fontSize: 20,
                                    fontWeight: FontWeight.w500),),
                                //   child: Icon(FontAwesomeIcons.ad,color: Colors.green,size: 24,),
                              ),
                              title: Text("Rent"),
                              subtitle: Text("Debit"),
                              trailing: Text("\u20B9 17000"),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              // contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                              leading: CircleAvatar(
                                backgroundColor: hexToColor("#18334B"),

                                child: Text('C', style: TextStyle(fontSize: 20,
                                    fontWeight: FontWeight.w500),),
                                //   child: Icon(FontAwesomeIcons.ad,color: Colors.green,size: 24,),
                              ),
                              title: Text("Petrol"),
                              subtitle: Text("Debit"),
                              trailing: Text("\u20B9 3200"),
                            ),
                          ),
                        ],
                      )
                  )

              )


            ],
          ),
        ),

      ),

    );
  }
}


