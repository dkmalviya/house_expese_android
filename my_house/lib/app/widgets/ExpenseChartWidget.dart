import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:myhouse/app/constant/data.dart';
import 'package:myhouse/app/models/ExpenseGraphModel.dart';
import 'package:myhouse/app/models/ExpenseSummaryModel.dart';

import 'ExpenseChart.dart';

class ExpenseChartWidget extends StatelessWidget {
  List<ExpenseGraphModel>myExpense;
  double amount=0;



  ExpenseChartWidget(this.myExpense,this.amount);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[

        Expanded(
          flex: 5,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: myExpense.map((value) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(radius: 5,backgroundColor: pieColor[myExpense.indexOf(value)],),
                    SizedBox(width: 5,),
                    Text(value.expenseCategory,style: TextStyle(fontSize: 18),)

                  ],
                ),
              )).toList()
            )

          ),
        ),



        Expanded(
          flex: 6,

          child: ExpenseChart(myExpense,amount),
        )
      ],
    );
  }
}
