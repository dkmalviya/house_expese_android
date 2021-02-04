import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myhouse/app/constant/data.dart';
import 'package:myhouse/app/models/ExpenseGraphModel.dart';
import 'package:myhouse/app/models/ExpenseSummaryModel.dart';
import 'package:myhouse/app/utils/utils.dart';
import 'package:myhouse/app/widgets/ExpenseChartWidget.dart';
import 'package:myhouse/app/widgets/MyAppBar.dart';
class ExpenseSummary extends StatefulWidget {



  @override
  _ExpenseSummaryState createState() => _ExpenseSummaryState();
}

class _ExpenseSummaryState extends State<ExpenseSummary> with SingleTickerProviderStateMixin    {
  static Set<ExpenseSummaryModel>myExpense = Set();

  List<ExpenseGraphModel> myGraphData=List();

  Map graphDataMap = new HashMap<String, double>();



  double totalExpense=0;

  double member1=0;
  double member2=0;
  TabController _controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();






    myExpense.clear();

    for (var testModel in sampleExpesne) {
      ExpenseSummaryModel expenseSummaryModelTemp = ExpenseSummaryModel(testModel['expenseName'],testModel['mode'],testModel['houseMember'],testModel['amount'] ,testModel['date'],testModel['expenseCategory']);
      setState(() {

        myExpense.add(expenseSummaryModelTemp);


        totalExpense=totalExpense+expenseSummaryModelTemp.amount;
        if(expenseSummaryModelTemp.houseMember.toLowerCase()=="deepesh"){
          member1=member1+expenseSummaryModelTemp.amount;

        }
        else if(expenseSummaryModelTemp.houseMember.toLowerCase()=="priya"){
          member2=member2+expenseSummaryModelTemp.amount;

        }





      });




    }

    setGraphData();
  }


  @override
  Widget build(BuildContext context) {

    final historyListView=ListView.builder(
        cacheExtent: 256,
        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
        itemCount: myExpense.length,
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
                    child: Text(myExpense.elementAt(index).houseMember.substring(0,1),style: TextStyle(
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
                myExpense.elementAt(index).expenseName,
                style: TextStyle(fontSize: 18,fontWeight:FontWeight.w600,color: Colors.black),
              ),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding:EdgeInsets.only(top: 7,bottom: 2),child: Text('Source : ' + myExpense.elementAt(index).houseMember,
                    style: TextStyle(fontSize: 15,color:Colors.black,),
                  ),),
                  Padding(padding:EdgeInsets.only(top: 7,bottom: 2),child: Text('Amount : ' + myExpense.elementAt(index).amount.toString(),
                    style: TextStyle(fontSize: 15,color:Colors.black,),
                  ),),
                  Padding(padding:EdgeInsets.only(top: 7,bottom: 2),child: Text('Mode : ' + myExpense.elementAt(index).mode,
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

    );


    final graphView= ExpenseChartWidget(myGraphData,totalExpense);





    return Scaffold(
        appBar:MyAppBar("Expense Summary",false,false),

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
                            child: Text("Total Expense",textAlign: TextAlign.justify,style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w300),maxLines: 5,overflow: TextOverflow.ellipsis,)


                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            child: Text("\u20B9 "+totalExpense.toString(),style: TextStyle(color: Colors.white,fontSize: 34,fontWeight: FontWeight.w400,letterSpacing: 2),maxLines: 5,overflow: TextOverflow.ellipsis,)


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
                                    Text("\u20B9 "+member1.toString(),style: TextStyle(color: Colors.white,)),
                                    SizedBox(height: 5,),
                                    Text("Deepesh Malviya",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300))
                                  ],
                                ),

                                Column(
                                  children: <Widget>[
                                    Text("\u20B9 "+member2.toString(),style: TextStyle(color: Colors.white)),
                                    SizedBox(height: 5,),
                                    Text("Priya Malviya",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300))
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
                //    contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 0),

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
                        "House Expenses"
                        ,style: TextStyle(
                        fontSize: 20,

                      ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),


                Expanded(

                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: <Widget>[
                        Container(
                          constraints: BoxConstraints.expand(height: 50),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                            decoration: BoxDecoration(
                                color: hexToColor("#B5AAE1"),
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      hexToColor('#395E7E'),
                                      hexToColor('#18334B'),
                                    ]
                                ),
                                boxShadow: customDarkShadow

                            ),
                            child: TabBar(
                                indicatorColor: Colors.white,
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.grey,

                                tabs: [
                                  Tab(text: "Transactions"),
                                  Tab(text: "Graph"),

                                ]),
                          ),
                        ),
                        Expanded(

                          child: TabBarView(children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                                child: historyListView
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 10),
                                child: graphView
                            ),

                          ]),

                        )




                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),












              ]),
        ));
  }




  void setGraphData(){

    setState(() {

      myExpense.forEach((element) {

        if(graphDataMap.containsKey(element.expenseCategory)){
          double amount= graphDataMap[element.expenseCategory];
          graphDataMap[element.expenseCategory]=amount+element.amount;

        }
        else{
          graphDataMap.putIfAbsent(element.expenseCategory, () => element.amount);

        }


      });


      graphDataMap.forEach((key, value) {

        ExpenseGraphModel temp=new ExpenseGraphModel(key, value);
        myGraphData.add(temp);
      });

    });




    print(graphDataMap.toString());



  }
}
