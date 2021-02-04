import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myhouse/app/constant/data.dart';
import 'package:myhouse/app/models/CheckListModel.dart';
import 'package:myhouse/app/utils/utils.dart';
import 'package:myhouse/app/widgets/MyAppBar.dart';

class CheckListHome extends StatefulWidget {

  @override
  _CheckListHomeState createState() => _CheckListHomeState();

}

class _CheckListHomeState extends State<CheckListHome> with SingleTickerProviderStateMixin    {
  static Set<CheckListModel>myCheckList = Set();
  static Set<CheckListModel>completedCheckList = Set();
  TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    myCheckList.clear();
    completedCheckList.clear();

    for (var testModel in sampleCheckList) {
      CheckListModel checkListModelTemp = CheckListModel(testModel['activityName'],DateTime.parse(testModel['date']),testModel['isCompleted']);
      setState(() {
        myCheckList.add(checkListModelTemp);
        if(checkListModelTemp.isCompleted){
          completedCheckList.add(checkListModelTemp);
        }
      });
    }
  }



  Widget completedButton(bool isCompleted,int index) {

    if(isCompleted==true){
      return IconButton(icon:Icon(FontAwesomeIcons.checkSquare ,color: Colors.green,),onPressed: (){
        setState(() {
          myCheckList.elementAt(index).isCompleted=false;
        });

      },);

    }
    else{
      return IconButton(icon:Icon(FontAwesomeIcons.square ,color: Colors.red,),onPressed: (){
        setState(() {
          myCheckList.elementAt(index).isCompleted=true;
        });


      },);
    }





  }

  @override
  Widget build(BuildContext context) {

    final toDoView=ListView.builder(
        cacheExtent: 256,
        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
        itemCount: myCheckList.length,
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
                    child: Text(myCheckList.elementAt(index).activityName.substring(0,1),style: TextStyle(
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
                myCheckList.elementAt(index).activityName,
                style: TextStyle(fontSize: 18,fontWeight:FontWeight.w600,color: Colors.black),
              ),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding:EdgeInsets.only(top: 7,bottom: 2),child: Text('Source : ' + myCheckList.elementAt(index).dateTime.toString(),
                    style: TextStyle(fontSize: 15,color:Colors.black,),
                  ),),

                ],
              ),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  completedButton(myCheckList.elementAt(index).isCompleted,index),
                  SizedBox(width: 10,),
                  Icon(
                    Icons.delete_forever,
                    size: 32,
                    color: Colors.red[200],
                  ),

                ],
              ),
              onTap: (){

              },
            ),
          );
        }
    );

    final completedView=ListView.builder(
        cacheExtent: 256,
        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
        itemCount: completedCheckList.length,
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
                    child: Text(completedCheckList.elementAt(index).activityName.substring(0,1),style: TextStyle(
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
                completedCheckList.elementAt(index).activityName,
                style: TextStyle(fontSize: 18,fontWeight:FontWeight.w600,color: Colors.black),
              ),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding:EdgeInsets.only(top: 7,bottom: 2),child: Text('Source : ' + completedCheckList.elementAt(index).dateTime.toString(),
                    style: TextStyle(fontSize: 15,color:Colors.black,),
                  ),),

                ],
              ),

              onLongPress: (){
                print("delete Called");
              },
            ),
          );
        }
    );





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
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: <Widget>[
                        Container(
                          constraints: BoxConstraints.expand(height: 50),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
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

                            child: TabBar(
                                indicatorColor: Colors.white,

                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.grey,

                                tabs: [
                                  Tab(text: "To Do",),

                                  Tab(text: "Completed"),

                                ]),
                          ),
                        ),
                        Expanded(

                          child: TabBarView(children: [
                            Container(
                                margin: EdgeInsets.only(top: 10),
                                child: toDoView
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 10),
                                child: completedView
                            ),

                          ]),

                        ),

                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20,),

              ]),
        ));

  }
}
