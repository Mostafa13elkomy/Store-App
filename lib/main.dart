import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/Pages/home.dart';
import 'package:store_app/Pages/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
    HomePage.id : (context) => HomePage(),
    UpdateProduct.id :(context) => UpdateProduct()
      },
      initialRoute: HomePage.id,
    );
  }
}
