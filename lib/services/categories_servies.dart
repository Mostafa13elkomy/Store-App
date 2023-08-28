import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';
class CategoriesServices {
  Future<List<productModel>> GetCategoriesProducts(
      {required String categoryName}) async {
      List<dynamic> data = await Api().get(
          url: 'https://fakestoreapi.com/products/category/$categoryName');
      List<productModel> productList = [];
      for (int i = 0; i < data.length; i++) {
        productList.add(
          productModel.fromJson(data[i]),
        );
      }
      return productList;
    }
    }
  

