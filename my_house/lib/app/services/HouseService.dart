import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myhouse/app/models/HouseModel.dart';
import 'package:myhouse/app/services/UserService.dart';

class HouseService{
  UserService _userService = new UserService();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int statusCode;

  Future<HouseModel> getHouseDetails() async{
    HouseModel houseDetails = new HouseModel();
    String uid = await _userService.getUserId();
    QuerySnapshot profileData = await _firestore.collection('house').where('userId',isEqualTo: uid).get();

    houseDetails.houseId = profileData.docs[0].data()['houseId'];
    houseDetails.houseNumber = profileData.docs[0].data()['houseNumber'];
    houseDetails.buildingName = profileData.docs[0].data()['buildingName'];
    houseDetails.street = profileData.docs[0].data()['street'];
    houseDetails.area = profileData.docs[0].data()['area'];
    houseDetails.landmark = profileData.docs[0].data()['landmark'];
    houseDetails.city = profileData.docs[0].data()['city'];
    houseDetails.pincode = profileData.docs[0].data()['pincode'];
    houseDetails.houseName = profileData.docs[0].data()['houseName'];
    return houseDetails;
  }

  Future<void> addHouse(HouseModel houseModel) async{
    var documentReference = await _firestore.collection('house').add({
    'houseId':  houseModel.houseId,
    'houseNumber': houseModel.houseNumber,
    'buildingName':  houseModel.buildingName,
    'street': houseModel.street,
    'area': houseModel.area,
    'landmark': houseModel.landmark,
    'city': houseModel.city,
    'pincode': houseModel.pincode,
    'houseName': houseModel.houseName
    });

    print(documentReference.toString());
  }
}