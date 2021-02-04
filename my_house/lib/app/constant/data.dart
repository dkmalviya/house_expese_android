import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myhouse/app/utils/utils.dart';


List<BoxShadow> customShadow =[
  BoxShadow(
      color: Colors.white.withOpacity(0.5),
      spreadRadius: -5,
      offset: Offset(-5,-5),
      blurRadius: 30
  ),
  BoxShadow(
      color: Colors.blue.withOpacity(0.2),
      spreadRadius: 2,
      offset: Offset(7,7),
      blurRadius: 20

  )
];


List<BoxShadow> customDarkShadow=
[
  BoxShadow(
    color: hexToColor("#000000"),
    offset: Offset(0.0, 3.0), //(x,y)
    blurRadius: 8.0,
  ),
];


List expense=[
  {"name":"Hotel","amount":7000.0},
  {"name":"Grocery","amount":2000.0},
  {"name":"Fuel","amount":1000.0},
  {"name":"Bills","amount":6000.0},
  {"name":"Rent","amount":17000.0},
  {"name":"Shopping","amount":500.0}
];


List dashIcons=[
  {"icon":FontAwesomeIcons.wallet,"title":"Income","screen":"/income_summary"},
  {"icon":FontAwesomeIcons.creditCard,"title":"Expense","screen":"/expense_summary"},
  {"icon":FontAwesomeIcons.users,"title":"Members","screen":"/house_summary"},
  {"icon":FontAwesomeIcons.solidHeart,"title":"Favorite","screen":"/favorite"},
  {"icon":FontAwesomeIcons.solidBell,"title":"Reminder","screen":"/reminder_summary"},
  {"icon":FontAwesomeIcons.key,"title":"Credentials","screen":"/password_summary"},
  {"icon":FontAwesomeIcons.history,"title":"Transactions","screen":"/transaction_summary"},
  {"icon":FontAwesomeIcons.checkSquare,"title":"TODO","screen":"/checklist"}
];

List pieColor=[
  Colors.indigo[400],
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.deepOrange,
  Colors.brown,
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.deepOrange,
  Colors.brown,
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.deepOrange,
  Colors.brown,
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.deepOrange,
  Colors.brown,
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.deepOrange,
  Colors.brown,
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.deepOrange,
  Colors.brown,


];



List catergories=[
  {"name":"Rent","isFavorite":true},
  {"name":"Milk","isFavorite":true},
  {"name":"Egg","isFavorite":true},
  {"name":"G-Pay","isFavorite":false},
  {"name":"Recharge","isFavorite":true},
  {"name":"Water","isFavorite":false},
  {"name":"Electricity","isFavorite":true},
  {"name":"Mobile Bill","isFavorite":false},
  {"name":"Petrol","isFavorite":true},
  {"name":"Diesel","isFavorite":false},
  {"name":"Ice-Cream","isFavorite":true},
  {"name":"Toll","isFavorite":false},
  {"name":"Vagitables","isFavorite":true},
  {"name":"Grocery","isFavorite":false}
];




List sampleReminder=[
  {"name":"Priya Malviya","occasion":"Birthday","isNotificationEnable":false,"occasionDate":"11-01-1994"},
  {"name":"Deepesh Malviya","occasion":"Birthday","isNotificationEnable":true,"occasionDate":"14-03-1991"},
  {"name":"My Wedding Anniversary","occasion":"Wedding","isNotificationEnable":true,"occasionDate":"03-02-2020"},
  {"name":"Itr Return","occasion":"Work","isNotificationEnable":false,"occasionDate":"20-09-2020"},
  {"name":"My House Inauguration","occasion":"Inauguration","isNotificationEnable":false,"occasionDate":"20-01-1999"},
];

List occations=[
  {"occasionName":"Birthday","icon":Icons.cake},
  {"occasionName":"Wedding","icon":Icons.group},
  {"occasionName":"Work","icon":Icons.work},
  {"occasionName":"Inauguration","icon":Icons.lock_open},
  {"occasionName":"Event","icon":FontAwesomeIcons.calendar},
];


List sampleIncome=[
  {"incomeSourceType":"Salary","mode":"Bank Transfer","houseMember":"Deepesh","amount":"39000"},
  {"incomeSourceType":"Interest","mode":"Bank Transfer","houseMember":"Deepesh","amount":"500"},
  {"incomeSourceType":"Cashback","mode":"G-Pay","houseMember":"Deepesh","amount":"1000"},
  {"incomeSourceType":"Return","mode":"Bank Transfer","houseMember":"Deepesh","amount":"1000"},
  {"incomeSourceType":"Gift","mode":"G-Pay","houseMember":"Priya","amount":"1000"},
  {"incomeSourceType":"Salary","mode":"Bank Transfer","houseMember":"Priya","amount":"30000"},
  {"incomeSourceType":"ITR-Return","mode":"Online","houseMember":"Priya","amount":"5000"},


];

List sampleExpesne=[
  {"expenseName":"Rent-Aug-2020","mode":"Bank Transfer","houseMember":"Deepesh","amount":17000.0,"date":"01-08-2020","expenseCategory":"Rent"},
  {"expenseName":"Dinner","mode":"Credit Card","houseMember":"Deepesh","amount":2000.0,"date":"19-08-2020","expenseCategory":"Food"},
  {"expenseName":"Monthly Grocery","mode":"Credit Card","houseMember":"Deepesh","amount":2500.0,"date":"01-08-2020","expenseCategory":"Grocery"},
  {"expenseName":"Vegi","mode":"G-pay","houseMember":"Deepesh","amount":650.0,"date":"12-08-2020","expenseCategory":"Vegitable"},
  {"expenseName":"Fruits","mode":"G-pay","houseMember":"Deepesh","amount":355.0,"date":"20-08-2020","expenseCategory":"Vegitable"},
  {"expenseName":"RO Water","mode":"G-pay","houseMember":"Priya","amount":70.0,"date":"01-08-2020","expenseCategory":"Water"},
  {"expenseName":"RO Water","mode":"G-pay","houseMember":"Priya","amount":70.0,"date":"07-08-2020","expenseCategory":"Water"},
  {"expenseName":"RO Water","mode":"G-pay","houseMember":"Priya","amount":70.0,"date":"14-08-2020","expenseCategory":"Water"},
  {"expenseName":"RO Water","mode":"G-pay","houseMember":"Priya","amount":70.0,"date":"21-08-2020","expenseCategory":"Water"},
  {"expenseName":"Education loan","mode":"Online","houseMember":"Priya","amount":9500.0,"date":"05-08-2020","expenseCategory":"Loan"},
  {"expenseName":"Pesonal Loan","mode":"Online","houseMember":"Priya","amount":5000.0,"date":"05-08-2020","expenseCategory":"Loan"},
  {"expenseName":"Personal Loan","mode":"Online","houseMember":"Deepesh","amount":2400.0,"date":"05-08-2020","expenseCategory":"Loan"},
  {"expenseName":"Car Loan","mode":"Online","houseMember":"Deepesh","amount":16959.0,"date":"03-08-2020","expenseCategory":"Loan"},



];


//Sample CheckList
List sampleCheckList=[
  {"activityName":"Grocery Shopping","date":"2020-02-28","isCompleted":false},
  {"activityName":"Laptop Repair","date":"2020-02-28","isCompleted":false},
  {"activityName":"Cleaning","date":"2020-02-27","isCompleted":true},
  {"activityName":"Diesel Top up","date":"2020-02-26","isCompleted":false},
  {"activityName":"Tata Sky Recharge","date":"2020-02-25","isCompleted":true},
  {"activityName":"FD Renewal","date":"2020-02-28","isCompleted":false},
  {"activityName":"Vegitables","date":"2020-02-28","isCompleted":true},
  {"activityName":"Netflix Un-Subscribe ","date":"2020-02-28","isCompleted":false}
];



List accountImages=[
  {"accountName":"gmail","image":"assets/images/accounts/gmail.png"},
  {"accountName":"facebook","image":"assets/images/accounts/facebook.png"},
  {"accountName":"outlook","image":"assets/images/accounts/outlook.png"},
  {"accountName":"git","image":"assets/images/accounts/git.png"},
  {"accountName":"linkedin","image":"assets/images/accounts/linkedin.png"},
  {"accountName":"twitter","image":"assets/images/accounts/twitter.png"},
  {"accountName":"instagram","image":"assets/images/accounts/instagram.png"},
  {"accountName":"atos","image":"assets/images/accounts/atos.png"},
  {"accountName":"bank","image":"assets/images/accounts/bank.png"},
  {"accountName":"work","image":"assets/images/accounts/work.png"}
];