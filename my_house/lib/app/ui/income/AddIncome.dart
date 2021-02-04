import 'package:flutter/material.dart';
import 'package:myhouse/app/utils/utils.dart';
import 'package:myhouse/app/widgets/MyAppBar.dart';
class AddIncome extends StatefulWidget {



  @override
  _AddIncomeState createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {

  String _selectedIncomeSource;
  List<String> _incomeSources = ["Salary","Gift","ITR Return","Cashback","Interest","Profit","Bonus","Resell","Loan","Provident Fund","Others"];
  List<DropdownMenuItem<String>> _dropdownMenuSourceItems;

  List<String> _incomeModes = ["Online","Bank Transfer","Cash","G-Pay","Others"];
  List<DropdownMenuItem<String>> _dropdownMenuModeItems;


  TextEditingController categoryTextController = TextEditingController();

  String _selectedIncomeMode;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dropdownMenuSourceItems=buildDropdownMenuItems(_incomeSources);
    _dropdownMenuModeItems = buildDropdownMenuItems(_incomeModes);
  }

  @override
  Widget build(BuildContext context) {


    final incomeSourceSelector=Container(


      child: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: hexToColor('#18334B'),
        ),
        child: DropdownButtonFormField(
          style: new TextStyle(color: Colors.white, fontSize: 16),
          isExpanded: true,

          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(8.0, 1.8, 8.0, 1.8),
            filled: true,
            fillColor: hexToColor('#18334B'),
            hintText: "Select Income Source",
            hintStyle: TextStyle(color: Colors.grey),

          ),
          value: _selectedIncomeSource,
          items: _dropdownMenuSourceItems,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          iconSize: 24,
          onChanged: OnChangeDropdownSourceItem,
        ),
      ),
    );
    final incomeModeSelector=Container(


      child: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: hexToColor('#18334B'),
        ),
        child: DropdownButtonFormField(
          style: new TextStyle(color: Colors.white, fontSize: 16),
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(8.0, 1.8, 8.0, 1.8),
            filled: true,
            hintText: "Select Income Mode",
            hintStyle: TextStyle(color: Colors.grey),
            fillColor: hexToColor('#18334B'),
          ),
          value: _selectedIncomeMode,
          items: _dropdownMenuModeItems,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          iconSize: 24,
          onChanged: OnChangeDropdownModeItem,
        ),
      ),
    );


    final amountFormField=Container(


      child: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: hexToColor('#18334B'),
        ),
        child: TextFormField(
          style: new TextStyle(color: Colors.white, fontSize: 16),

          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(8.0, 1.8, 8.0, 1.8),
            filled: true,
            hintText: "Enter Amount",
            hintStyle: TextStyle(color: Colors.grey),
            fillColor: hexToColor('#18334B'),
          ),
        ),
      ),
    );




    return Scaffold(
      appBar:MyAppBar("Income Summary",false,false),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Column(
          children: <Widget>[



            incomeSourceSelector,
            SizedBox(height: 20,),
            incomeModeSelector,
            SizedBox(height: 20,),
            amountFormField,
            SizedBox(height: 40,),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 140,
                  child: RaisedButton(
                    onPressed: (){

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Save",style: TextStyle(color: Colors.white,fontSize: 18),),
                    ),
                    elevation: 10,
                    color:  hexToColor('#18334B'),
                  ),
                ),
                Container(
                  width: 140,
                  child: RaisedButton(
                    onPressed: (){

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Clear",style: TextStyle(color: Colors.white,fontSize: 18),),
                    ),
                    elevation: 10,
                    color:  Colors.red[900]
                  ),
                )
              ],
            )
          ],
        ),



      ),


    );
  }

  List<DropdownMenuItem<String>> buildDropdownMenuItems(
      List searchSources) {
    List<DropdownMenuItem<String>> items = List();
    for (String source in searchSources) {
      items.add(
        DropdownMenuItem(
          value: source,
          child: Text(source),
        ),
      );
    }
    return items;
  }

  OnChangeDropdownModeItem(String selectSource) {
    setState(() {
      _selectedIncomeMode = selectSource;
      categoryTextController.text=selectSource;

    });
  }
  OnChangeDropdownSourceItem(String selectSource) {
    setState(() {
      _selectedIncomeSource = selectSource;
      categoryTextController.text=selectSource;

    });
  }
}
