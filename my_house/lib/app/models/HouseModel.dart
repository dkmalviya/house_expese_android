class HouseModel{
String houseId;
String houseNumber;
String buildingName;
String street;
String area;
String landmark;
String city;
String pincode;
String houseName;

HouseModel({this.houseId, this.houseNumber, this.buildingName, this.street,
      this.area, this.landmark, this.city, this.pincode, this.houseName});

factory HouseModel.fromJson(Map<String, dynamic> json) =>
    HouseModel(
      houseId: json["houseId"],
      houseNumber: json["houseNumber"],
      buildingName: json["buildingName"],
      street: json["street"],
      area: json["area"],
      landmark: json["landmark"],
      city: json["city"],
      pincode: json["pincode"],
      houseName: json["houseName"],

    );

Map<String, dynamic> toJson() =>
    {
      "houseId": houseId,
      "houseNumber": houseNumber,
      "buildingName": buildingName,
      "street": street,
      "area": area,
      "landmark": landmark,
      "city": city,
      "pincode": pincode,
      "houseName": houseName,


    };


@override
  String toString() {
    return 'HouseModel{houseId: $houseId, houseNumber: $houseNumber, buildingName: $buildingName, street: $street, area: $area, landmark: $landmark, city: $city, pincode: $pincode, houseName: $houseName}';
  }
}