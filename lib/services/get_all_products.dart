import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';



class AllProductsService {
  Future<List<productModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<productModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        productModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}