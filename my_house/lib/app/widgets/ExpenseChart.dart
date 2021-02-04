
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhouse/app/constant/data.dart';
import 'package:myhouse/app/models/ExpenseGraphModel.dart';
import 'package:myhouse/app/models/ExpenseSummaryModel.dart';
import 'package:myhouse/app/utils/utils.dart';

class ExpenseChart extends StatelessWidget {

  List<ExpenseGraphModel>myExpense;

  double totalExpense=0;


  ExpenseChart(this.myExpense, this.totalExpense);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 15),
        child:Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow:customDarkShadow,
              color: hexToColor("#CADCED")

          ),
          child: Stack(

            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: CustomPaint(
                  child: Container(),
                  foregroundPainter: ExpenseChartPainter(myExpense),),
              ),

              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  child: Center(child: Text("\u20B9 "+totalExpense.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow:customDarkShadow,
                      color: hexToColor("#CADCED")

                  ),
                ),
              ),
            ],

          ),



        ));
  }
}

class ExpenseChartPainter extends CustomPainter{

  List<ExpenseGraphModel>myExpense;


  ExpenseChartPainter(this.myExpense);

  @override
  void paint(Canvas canvas, Size size) {
    Offset center=Offset(size.width/2,size.height/2);
    double radius=min(size.width/2,size.height/2);



    var paint= new Paint()..style=PaintingStyle.stroke..strokeWidth=50;
    double total=0;
    myExpense.forEach((element) {
      total+=element.amount;

    });
    double startRadian = -pi / 2;
    for(int i=0;i<myExpense.length;i++){
      final currentExpense = myExpense[i];
      final sweepRadian = (currentExpense.amount / total ) * 2  * pi;
      paint.color = pieColor[i];
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startRadian, sweepRadian, false, paint);
      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {

    return true;
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
