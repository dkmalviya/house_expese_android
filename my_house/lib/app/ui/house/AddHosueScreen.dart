import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myhouse/app/models/HouseModel.dart';
import 'package:myhouse/app/services/HouseService.dart';
import 'package:myhouse/app/services/ProfileService.dart';
import 'package:myhouse/app/utils/ui_utils.dart';
import 'package:myhouse/app/widgets/MyAppBar.dart';
import 'package:myhouse/main.dart';
import 'package:uuid/uuid.dart';

class AddHouseScreen extends StatefulWidget {
  @override
  _AddHouseScreenState createState() => _AddHouseScreenState();
}

class _AddHouseScreenState extends State<AddHouseScreen> {

  HouseService _houseService=HouseService();
  TextEditingController textEditingControllerHouse=TextEditingController();
  TextEditingController textEditingControllerBuilding=TextEditingController();
  TextEditingController textEditingControllerStreet=TextEditingController();
  TextEditingController textEditingControllerArea=TextEditingController();
  TextEditingController textEditingControllerLandmark=TextEditingController();
  TextEditingController textEditingControllerCity=TextEditingController();
  TextEditingController textEditingControllerPin=TextEditingController();
  TextEditingController textEditingControllerHouseName=TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

     textEditingControllerHouse.text="B-201";
     textEditingControllerBuilding.text="Regalia Residency";
     textEditingControllerStreet.text= "Mumbai-Pune Highway";
     textEditingControllerArea.text="Bavdhan";
     textEditingControllerLandmark.text="Near Crystal Honda";
     textEditingControllerCity.text="Pune";
     textEditingControllerPin.text="411057";
     textEditingControllerHouseName.text="B201";

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: MyAppBar("Add House", true,false),

        body: Column(
            children: [
              Expanded(child: ListView(
                padding: EdgeInsets.all(15),
                children: [

                  TextField(
                    controller: textEditingControllerHouse,
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.home),
                      hintText: "Enter house number",
                    ),

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: textEditingControllerBuilding,
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.solidBuilding),
                      hintText: "Enter society name",
                    ),

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: textEditingControllerStreet,
                    decoration: InputDecoration(

                      prefixIcon: Icon(FontAwesomeIcons.road),
                      hintText: "Enter street name",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: textEditingControllerLandmark,
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.landmark),
                      hintText: "Enter nearest landmark",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: textEditingControllerArea,
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.mapMarkedAlt),
                      hintText: "Enter Area",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: textEditingControllerCity,
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.city),
                      hintText: "Enter city name",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: textEditingControllerPin,
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.mapPin),
                      hintText: "Enter city pin",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: textEditingControllerHouseName,
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.signature),
                      hintText: "Enter nick name",
                    ),
                  ),
                ],

              )
              ),
              InkWell(


                child: Container(
                  decoration: BoxDecoration(
                      gradient: linearGrayGradient,
                      borderRadius:
                      BorderRadius.circular(
                          30.0)),
                  constraints: BoxConstraints(
                      maxWidth: 250.0,
                      minHeight: 55.0),
                  alignment: Alignment.center,

                  child: Text(
                    "Save Address",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white),
                  ),
                ),

                onTap: ()async{
                  HouseModel houseModel=HouseModel();
                  var uuid = Uuid();
                  houseModel.houseId=uuid.v1();
                  houseModel.houseNumber=textEditingControllerHouse.text;
                  houseModel.buildingName=textEditingControllerBuilding.text;
                  houseModel.street=textEditingControllerStreet.text;
                  houseModel.area=textEditingControllerArea.text;
                  houseModel.landmark=textEditingControllerLandmark.text;
                  houseModel.city=textEditingControllerCity.text;
                  houseModel.pincode=textEditingControllerPin.text;
                  houseModel.houseName=textEditingControllerHouseName.text;
                  await _houseService.addHouse(houseModel);
                  ProfileService profileService=ProfileService();
                  profileService.updateHouseOfUser(houseModel.houseId);

                  saveToAppLocal(houseModel);





                  Navigator.pop(context, 'Updated');
                },
              ),
              SizedBox(height: 20,)
            ])


    );
  }
}

void saveToAppLocal(HouseModel houseModelTemp) {
  MyApp.houseModel.houseId=  houseModelTemp.houseId;
  MyApp.houseModel.houseNumber=  houseModelTemp.houseNumber;
  MyApp.houseModel.buildingName=  houseModelTemp.buildingName;
  MyApp.houseModel.street=  houseModelTemp.street;
  MyApp.houseModel.area=  houseModelTemp.area;
  MyApp.houseModel.landmark=houseModelTemp.landmark;
  MyApp.houseModel.city=houseModelTemp.city;
  MyApp.houseModel.pincode=houseModelTemp.pincode;
  MyApp.houseModel.houseName=houseModelTemp.houseName;
}
