import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myhouse/app/constant/data.dart';
import 'package:myhouse/app/models/IncomeSummaryModel.dart';
import 'package:myhouse/app/utils/utils.dart';
import 'package:myhouse/app/widgets/MyAppBar.dart';
class IncomeSummary extends StatefulWidget {



  @override
  _IncomeSummaryState createState() => _IncomeSummaryState();
}

class _IncomeSummaryState extends State<IncomeSummary> {
  static Set<IncomeSummaryModel>myIncome = Set();
  double totalIncome=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    myIncome.clear();

    for (var testModel in sampleIncome) {
      IncomeSummaryModel incomeSummaryModelTemp = IncomeSummaryModel(testModel['incomeSourceType'],testModel['mode'],testModel['houseMember'],testModel['amount'] );
      setState(() {
        myIncome.add(incomeSummaryModelTemp);
        totalIncome=totalIncome+double.parse(incomeSummaryModelTemp.amount);


      });
    }
  }


  @override
  Widget build(BuildContext context) {





    return Scaffold(
        appBar:MyAppBar("Income Summary",false,false),

        body:Container(
          color: hexToColor("#CADCED"),
          width: MediaQuery
              .of(context)
              .size
              .width,
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
                    height: 210,
                    decoration: BoxDecoration(

                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            hexToColor('#395E7E'),
                            hexToColor('#18334B'),
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
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 4),
                            child: Text("Total Income",textAlign: TextAlign.justify,style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w300),maxLines: 5,overflow: TextOverflow.ellipsis,)


                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            child: Text("\u20B9 "+totalIncome.toString(),style: TextStyle(color: Colors.white,fontSize: 34,fontWeight: FontWeight.w400,letterSpacing: 2),maxLines: 5,overflow: TextOverflow.ellipsis,)


                        ),

                        Container(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 4),
                            child: Text("December-2020",textAlign: TextAlign.justify,style: TextStyle(color: Colors.lightGreenAccent,fontSize: 14,fontWeight: FontWeight.w300),maxLines: 5,overflow: TextOverflow.ellipsis,)


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
                                    Text("\u20B9 10000.00",style: TextStyle(color: Colors.white,)),
                                    SizedBox(height: 5,),
                                    Text("Savings",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300))
                                  ],
                                ),

                                Column(
                                  children: <Widget>[
                                    Text("\u20B9 100000.00",style: TextStyle(color: Colors.white)),
                                    SizedBox(height: 5,),
                                    Text("Credit Cards",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300))
                                  ],
                                )
                              ],
                            ),
                          ),


                        )


                      ],
                    ),


                  ),


                ),

                SizedBox(height: 5,),



                Container(
                  //   padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  child: ListTile(

                    leading:Icon(FontAwesomeIcons.rupeeSign,color: hexToColor("#18334B"),),
                    trailing: Container(

                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: hexToColor("#395E7E"),
                          borderRadius: BorderRadius.circular(25),
                        ),


                        child: InkWell(
                            onTap: (){
                              Navigator.of(context).pushNamed("/add_income");
                            },
                            child: Icon(FontAwesomeIcons.plus,color: Colors.white,)
                        )
                    ),
                    title: Align(
                      alignment: Alignment(-1.2, 0),
                      child: Text(
                        "Credits"
                        ,style: TextStyle(
                        fontSize: 20,

                      ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),

                Expanded(

                  child: ListView.builder(
                      cacheExtent: 256,
                      padding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
                      itemCount: myIncome.length,
                      itemBuilder: (BuildContext context,int index){
                        return Card(


                          child:ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 15),


                            leading:Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: hexToColor("#B5AAE1"),
                                  borderRadius: BorderRadius.circular(25),
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
                              child: Center(
                                  child: Text(myIncome.elementAt(index).houseMember.substring(0,1),style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600
                                  ),)
                              ),
                            ),


                            /*CircleAvatar(
                          backgroundColor: hexToColor("#18334B"),
                          child: occasionIcon(sampleReminder[index]['occasion']),
                        ),*/

                            title: Padding(padding:EdgeInsets.only(top: 2),child:Text(
                              myIncome.elementAt(index).incomeSourceType,
                              style: TextStyle(fontSize: 18,fontWeight:FontWeight.w600,color: Colors.black),
                            ),),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(padding:EdgeInsets.only(top: 7,bottom: 2),child: Text('Source : ' + myIncome.elementAt(index).houseMember,
                                  style: TextStyle(fontSize: 15,color:Colors.black,),
                                ),),
                                Padding(padding:EdgeInsets.only(top: 7,bottom: 2),child: Text('Amount : ' + myIncome.elementAt(index).amount,
                                  style: TextStyle(fontSize: 15,color:Colors.black,),
                                ),),
                                Padding(padding:EdgeInsets.only(top: 7,bottom: 2),child: Text('Mode : ' + myIncome.elementAt(index).mode,
                                  style: TextStyle(fontSize: 15,color:Colors.black,),
                                ),),
                              ],
                            ),


                            trailing: Icon(
                              Icons.delete_forever,
                              size: 32,
                              color: Colors.red[200],
                            ),
                            onTap: (){

                            },
                          ),

                        );
                      }

                  ),
                )




              ]),
        ));
  }
}
