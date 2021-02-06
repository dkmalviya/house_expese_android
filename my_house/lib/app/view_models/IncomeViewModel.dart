/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myhouse/app/Locator.dart';
import 'package:myhouse/app/models/IncomeModel.dart';
import 'package:myhouse/app/services/Api.dart';

class IncomeViewModel extends ChangeNotifier {
  Api _api = locator<Api>();

  List<IncomeModel> products;


  Future<List<IncomeModel>> fetchProducts() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => IncomeModel.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<IncomeModel> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  IncomeModel.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
    await _api.removeDocument(id) ;
    return ;
  }
  Future updateProduct(IncomeModel data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addIncome(IncomeModel data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}*/
