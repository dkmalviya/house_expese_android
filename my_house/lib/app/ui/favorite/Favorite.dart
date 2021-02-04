import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myhouse/app/constant/data.dart';
import 'package:myhouse/app/models/ExpenseCategoryModel.dart';
import 'package:myhouse/app/utils/utils.dart';
import 'package:myhouse/app/widgets/MyAppBar.dart';
class Favorite extends StatefulWidget {

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {

  static List<ExpenseCategoryModel>expenseCategories = List();
  static Set<ExpenseCategoryModel>myFavoriteExpenses = Set();

  AutoCompleteTextField<ExpenseCategoryModel> smartAssetTextField;

  GlobalKey<AutoCompleteTextFieldState<ExpenseCategoryModel>> assetKey=GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    expenseCategories.clear();
    myFavoriteExpenses.clear();

    for (var testModel in catergories) {
      ExpenseCategoryModel expenseCategoryModelTemp = ExpenseCategoryModel(testModel['name'],testModel['isFavorite'] );
      setState(() {
        expenseCategories.add(expenseCategoryModelTemp);

        if(expenseCategoryModelTemp.isFavorite){
          myFavoriteExpenses.add(expenseCategoryModelTemp);
        }
      });
    }
  }



  @override
  Widget build(BuildContext context) {

    Widget favoriteIcon(bool value) {
      if (value) {
        return Icon(FontAwesomeIcons.solidHeart,color: Colors.red,);
    }
      return Icon(FontAwesomeIcons.heart,color: Colors.red,);
    }

    smartAssetTextField = AutoCompleteTextField<ExpenseCategoryModel>(
      key:assetKey,
      clearOnSubmit: true,
      suggestions: expenseCategories,

      style: new TextStyle(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14,horizontal: 20),
        hintText: "Enter category name",
        hintStyle: TextStyle(color: Colors.white30),
        suffixIcon: IconButton(
          onPressed: () {

          },
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          color: Colors.transparent,
        ),
      ),
      itemBuilder: (BuildContext context, ExpenseCategoryModel expenseCategoryModel) {
        return Container(
          child: new Padding(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(12,8,12,14),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(expenseCategoryModel.categoryName),
                        favoriteIcon(expenseCategoryModel.isFavorite)
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                  )
                ],
              ),
              padding: EdgeInsets.all(8.0)),
        );
      },
      itemFilter: (expenseCategoryModel,query){
        return expenseCategoryModel.categoryName.toUpperCase().startsWith(query.toUpperCase());
      },
      itemSorter: (ExpenseCategoryModel a, ExpenseCategoryModel b) {
        return a.categoryName.compareTo(b.categoryName);
      },
      itemSubmitted: (expenseCategoryModel){

       myFavoriteExpenses.add(expenseCategoryModel);


      },
    );






    return Scaffold(

      appBar: MyAppBar("Favorite", false, false),
      body:Container(
        color: hexToColor("#CADCED"),
        width: MediaQuery
            .of(context)
            .size
            .width,

        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: hexToColor("#B5AAE1"),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        hexToColor('#395E7E'),
                        hexToColor('#18334B'),
                        hexToColor('#18334B'),
                      ]
                  ),
                  boxShadow: customDarkShadow

              ),
              child: Container(
                margin: EdgeInsets.all(15),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        hexToColor('#18334B'),
                        hexToColor('#395E7E'),
                        //hexToColor('#A5FECB'),
               ]
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: hexToColor("#000000"),
                      offset: Offset(0.0, 5.0), //(x,y)
                      blurRadius: 8.0,
                    ),
                  ],
                ),

                child: Column(
                  children: <Widget>[
                    Container(
                      child:smartAssetTextField,
                    ),

                  ],
                ),
              ),
            ),//End Of Search Box

            SizedBox(height: 5,),



            Container(
           //   padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: ListTile(
                leading:Icon(FontAwesomeIcons.solidHeart,color: Colors.pink,),
                title: Align(
                  alignment: Alignment(-1.2, 0),
                  child: Text(
                    "My Favorites"
                    ,style: TextStyle(
                    fontSize: 20,
                    
                  ),
                    textAlign: TextAlign.left,
                  ),
                ),


                trailing: Container(

                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: hexToColor("#395E7E"),
                      borderRadius: BorderRadius.circular(25),
                    ),


                    child: InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed("/add_favorite");
                        },
                        child: Icon(FontAwesomeIcons.plus,color: Colors.white,)
                    )
                ),
              ),
            ),

            Expanded(

              child: ListView.builder(
                  cacheExtent: 256,
                  padding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
                  itemCount: myFavoriteExpenses.length,
                  itemBuilder: (BuildContext context,int index){
                    return Card(


                      child:ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 15),

                        title: Padding(padding:EdgeInsets.only(top: 2),child:Text(
                           myFavoriteExpenses.elementAt(index).categoryName,
                          style: TextStyle(fontSize: 18,fontWeight:FontWeight.w600,color: Colors.black),
                        ),),
                        subtitle: Padding(padding:EdgeInsets.only(top: 7,bottom: 2),child: Text('Asset Id : ' + myFavoriteExpenses.elementAt(index).categoryName,
                          style: TextStyle(fontSize: 15,color:Colors.black,),
                        ),),

                        trailing: Icon(
                          Icons.delete_forever,
                          size: 32,
                          color: Colors.red[200],
                        ),
                        onTap: (){

                        },
                      ),

                    );
                  }

              ),
            )






          ],
        ),
      ),
    );
  }
}
