class UserInfoModel {
  String userId;
  String fullName;
  String email;
  String mobileNumber;
  String currentHouseId;
  String isOwnerOfHouse;

  UserInfoModel({
    this.userId,
    this.fullName,
    this.email,
    this.mobileNumber,
    this.currentHouseId,
    this.isOwnerOfHouse,

  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      UserInfoModel(
          userId: json["userId"],
          fullName: json["fullName"],
          email: json["email"],
          mobileNumber: json["mobileNumber"],
          currentHouseId: json["currentHouseId"],
          isOwnerOfHouse: json["isOwnerOfHouse"],

      );

  Map<String, dynamic> toJson() =>
      {
        "userId": userId,
        "fullName": fullName,
        "email": email,
        "mobileNumber": mobileNumber,
        "currentHouseId": currentHouseId,
        "isOwnerOfHouse": isOwnerOfHouse,


      };

  @override
  String toString() {
    return 'UserInfoModel{userId: $userId, fullName: $fullName, email: $email, mobileNumber: $mobileNumber, currentHouseId: $currentHouseId, isOwnerOfHouse: $isOwnerOfHouse}';
  }
}
