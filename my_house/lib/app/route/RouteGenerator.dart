import 'package:flutter/material.dart';
import 'package:myhouse/app/ui/checklist/CheckListHome.dart';
import 'package:myhouse/app/ui/credentials/AddNewCredential.dart';
import 'package:myhouse/app/ui/credentials/CredentialsHome.dart';
import 'package:myhouse/app/ui/dashboard/Dashboard.dart';
import 'package:myhouse/app/ui/expense/ExpenseSummary.dart';
import 'package:myhouse/app/ui/favorite/Favorite.dart';
import 'package:myhouse/app/ui/house/HouseSummary.dart';
import 'package:myhouse/app/ui/income/AddIncome.dart';
import 'package:myhouse/app/ui/income/IncomeSummary.dart';
import 'package:myhouse/app/ui/prelogin/LoginScreen.dart';
import 'package:myhouse/app/ui/prelogin/RegistrationScreen.dart';
import 'package:myhouse/app/ui/prelogin/SplashScreen.dart';
import 'package:myhouse/app/ui/reminder/Reminder.dart';
import 'package:myhouse/app/ui/reports/ExpenseMonthlySummary.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {


    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/registration':
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => Dashboard());
      case '/expense_summary':
        return MaterialPageRoute(builder: (_) => ExpenseSummary());
      case '/house_summary':
        return MaterialPageRoute(builder: (_) => HouseSummary());
      case '/favorite':
        return MaterialPageRoute(builder: (_) => Favorite());
      case '/reminder_summary':
        return MaterialPageRoute(builder: (_) => Reminder());
      case '/income_summary':
        return MaterialPageRoute(builder: (_) => IncomeSummary());
      case '/checklist':
        return MaterialPageRoute(builder: (_) => CheckListHome());
      case '/add_income':
        return MaterialPageRoute(builder: (_) => AddIncome());
      case '/add_favorite':
        return MaterialPageRoute(builder: (_) => AddIncome());
      case '/add_reminder':
        return MaterialPageRoute(builder: (_) => AddIncome());
      case '/password_summary':
        return MaterialPageRoute(builder: (_) => CredentialsHome());
      case '/add_password':
        return MaterialPageRoute(builder: (_) => AddNewCredential());




      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
