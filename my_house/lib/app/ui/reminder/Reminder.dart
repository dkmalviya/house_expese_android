import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myhouse/app/constant/data.dart';
import 'package:myhouse/app/models/ExpenseCategoryModel.dart';
import 'package:myhouse/app/models/ReminderModel.dart';
import 'package:myhouse/app/utils/utils.dart';
import 'package:myhouse/app/widgets/MyAppBar.dart';
class Reminder extends StatefulWidget {

  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {

  static Set<ReminderModel>myReminders = Set();



  var currentDate= new DateTime.now();


  AutoCompleteTextField<ReminderModel> smartAssetTextField;

  GlobalKey<AutoCompleteTextFieldState<ReminderModel>> assetKey=GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    myReminders.clear();

    for (var testModel in sampleReminder) {
      ReminderModel reminderModelTemp = ReminderModel(testModel['name'],testModel['occasion'],testModel['isNotificationEnable'],testModel['occasionDate'] );
      setState(() {
        myReminders.add(reminderModelTemp);
      });
    }
  }



  @override
  Widget build(BuildContext context) {

    Widget occasionIcon(String occasionName) {

      if (occasionName==occations[0]['occasionName']) {
        return Icon(occations[0]['icon'],color: Colors.white,);
      }
      else if (occasionName==occations[1]['occasionName']) {
        return Icon(occations[1]['icon'],color: Colors.white,);
      }
      else if (occasionName==occations[2]['occasionName']) {
        return Icon(occations[2]['icon'],color: Colors.white,);
      }
      else if (occasionName==occations[3]['occasionName']) {
        return Icon(occations[3]['icon'],color: Colors.white,);
      }
      return Icon(FontAwesomeIcons.heart,color: Colors.white,);
    }



    return Scaffold(

      appBar: MyAppBar("Reminder", false, false),
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
                height: 150,
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
                            Text("Upcoming Event",//currentDate.toUtc().toString(),
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),),
                            Text("IST",
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
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Center(
                                child: Icon(FontAwesomeIcons.birthdayCake,size: 32,color: Colors.white,)
                          ),
                          SizedBox(width: 20,),

                        Text("Priya Malviya",
                              style: TextStyle(
                                  fontSize: 26,

                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                          ),


                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          Center(
                              child: Icon(Icons.access_time,size: 32,color: Colors.white,)
                          ),
                          SizedBox(width: 20,),

                          Text("2020-08-26",
                            style: TextStyle(
                                fontSize: 18,

                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),//End Of Search Box

            SizedBox(height: 5,),



            Container(
              //   padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: ListTile(
                trailing: Container(

                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: hexToColor("#395E7E"),
                    borderRadius: BorderRadius.circular(25),
                  ),


                  child: InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed("/add_reminder");
                      },
                      child: Icon(FontAwesomeIcons.plus,color: Colors.white,)
                  )
                ),
                leading:Icon(FontAwesomeIcons.solidBell,color: hexToColor("#395E7E"),),
                title: Align(
                  alignment: Alignment(-1.2, 0),
                  child: Text(
                    "Reminders"
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
                  itemCount: myReminders.length,
                  itemBuilder: (BuildContext context,int index){
                    return Card(


                      child:ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 15),


                        leading:Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: hexToColor("#B5AAE1"),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
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
                            child: occasionIcon(sampleReminder[index]['occasion'])
                          ),
                        ),


                        /*CircleAvatar(
                          backgroundColor: hexToColor("#18334B"),
                          child: occasionIcon(sampleReminder[index]['occasion']),
                        ),*/

                        title: Padding(padding:EdgeInsets.only(top: 2),child:Text(
                          myReminders.elementAt(index).name,
                          style: TextStyle(fontSize: 18,fontWeight:FontWeight.w600,color: Colors.black),
                        ),),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(padding:EdgeInsets.only(top: 7,bottom: 2),child: Text('Event : ' + myReminders.elementAt(index).occasion,
                              style: TextStyle(fontSize: 15,color:Colors.black,),
                            ),),
                            Padding(padding:EdgeInsets.only(top: 7,bottom: 2),child: Text('Date : ' + myReminders.elementAt(index).occasionDate,
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






          ],
        ),
      ),
    );
  }
}
