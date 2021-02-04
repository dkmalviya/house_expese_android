// To parse this JSON data, do
//
//     final passwordParser = passwordParserFromJson(jsonString);

import 'dart:convert';

List<PasswordParser> passwordParserFromJson(String str) => List<PasswordParser>.from(json.decode(str).map((x) => PasswordParser.fromJson(x)));

String passwordParserToJson(List<PasswordParser> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PasswordParser {
  PasswordParser({
    this.encryptedPassword,
    this.accountName,
    this.userName,
    this.accountCategory,
    this.updatedOn,
    this.createdOn,
  });

  String encryptedPassword;
  String accountName;
  String userName;
  String accountCategory;
  dynamic updatedOn;
  dynamic createdOn;

  factory PasswordParser.fromJson(Map<String, dynamic> json) => PasswordParser(
    encryptedPassword: json["encryptedPassword"],
    accountName: json["accountName"],
    userName: json["userName"],
    accountCategory: json["accountCategory"],
    updatedOn: json["updatedOn"],
    createdOn: json["createdOn"],
  );

  Map<String, dynamic> toJson() => {
    "encryptedPassword": encryptedPassword,
    "accountName": accountName,
    "userName": userName,
    "accountCategory": accountCategory,
    "updatedOn": updatedOn,
    "createdOn": createdOn,
  };
}
