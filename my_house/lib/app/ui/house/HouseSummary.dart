import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myhouse/app/constant/data.dart';
import 'package:myhouse/app/utils/utils.dart';
import 'package:myhouse/app/widgets/MyAppBar.dart';
class HouseSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar:MyAppBar("House Summary",false,false),

        body:SingleChildScrollView(
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
                      height: 170,
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[

                                Icon(FontAwesomeIcons.home,color: Colors.white,),
                                SizedBox(width: 20,),
                                Expanded(child: Text("B-201 Regalia residency, Mumbai-Pune Highway Bavdhan Pune 411021",textAlign: TextAlign.justify,style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),maxLines: 5,overflow: TextOverflow.ellipsis,))

                              ],
                            ),
                          ),


                          Divider(
                            color: Colors.white,
                            indent: 15,
                            endIndent: 15,
                          ),

                          Container(
                            child:Card(
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
                                        Text("Deepesh Malviya",style: TextStyle(color: Colors.white,)),
                                        SizedBox(height: 5,),
                                        Text("Admin",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300))
                                      ],
                                    ),

                                    Column(
                                      children: <Widget>[
                                        Text("Priya Malviya",style: TextStyle(color: Colors.white)),
                                        SizedBox(height: 5,),
                                        Text("Member",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300))
                                      ],
                                    )
                                  ],
                                ),
                              ),


                            )


                          )


                        ],
                      ),


                    ),


                  ),

                  Container(

                    margin: EdgeInsets.all(15),

                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 250,
                    decoration: BoxDecoration(

                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            hexToColor('#00F260'),
                            hexToColor('#0575E6'),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Total House Income",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),),
                              Text("INR",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
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
                                color: Colors.black,),
                              SizedBox(width: 10,),
                              Text("73,000",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),),


                            ],
                          ),
                        ),

                        Divider(
                          color: Colors.black,
                          indent: 15,
                          endIndent: 15,
                        ),

                        Container(

                          child: Column(
                            children: <Widget>[
                              ListTile(
                                // contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                leading: CircleAvatar(
                                    backgroundColor: hexToColor("#18334B"),
                                    child: Icon(FontAwesomeIcons.male)

                                ),
                                title: Text("Deepesh Malviya",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                                subtitle: Text("Male",style: TextStyle(color: Colors.black87)),
                                trailing: Text("\u20B9 39000",style:TextStyle(color: Colors.black)),
                              ),
                              ListTile(

                                leading: CircleAvatar(
                                    backgroundColor: hexToColor("#18334B"),
                                    child: Icon(FontAwesomeIcons.female)
                                ),
                                title: Text("Priya Malviya",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                                subtitle: Text("Female",style: TextStyle(color: Colors.black87)),
                                trailing: Text("\u20B9 34000",style:TextStyle(color: Colors.black)),
                              ),
                            ],
                          ),

                        ),


                      ],
                    ),


                  ),
                   Container(

                    margin: EdgeInsets.all(15),

                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 250,
                    decoration: BoxDecoration(

                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [

                            hexToColor('#FF416C'),
                            hexToColor('#FF4B2B'),
                            hexToColor('#8A2387'),

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
                              Text("Total House Expense",
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
                              Text("56,000",
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

                        Container(

                          child: Column(
                            children: <Widget>[
                              ListTile(
                                // contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                leading: CircleAvatar(
                                    backgroundColor: hexToColor("#18334B"),
                                    child: Icon(FontAwesomeIcons.male)

                                ),
                                title: Text("Deepesh Malviya",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                                subtitle: Text("Male",style: TextStyle(color: Colors.white)),
                                trailing: Text("\u20B9 35,000",style:TextStyle(color: Colors.white)),
                              ),
                              ListTile(

                                leading: CircleAvatar(
                                    backgroundColor: hexToColor("#18334B"),
                                    child: Icon(FontAwesomeIcons.female)
                                ),
                                title: Text("Priya Malviya",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                                subtitle: Text("Female",style: TextStyle(color: Colors.white)),
                                trailing: Text("\u20B9 21,000",style:TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),

                        ),


                      ],
                    ),


                  ),
                ]
            )
        )





    );
  }
}
