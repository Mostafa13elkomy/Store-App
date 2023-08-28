import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
    HomePage({super.key});
  static String id = 'HomePage';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.cartShopping),
              color: Colors.black,
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'New Trend',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 100, left: 15, bottom: 77),
          child: FutureBuilder<List<productModel>>(
              future: AllProductsService().getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<productModel> products = snapshot.data!;
                  return GridView.builder(
                      itemCount: products.length,
                      clipBehavior: Clip.none,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.6,
                              mainAxisSpacing: 100,
                              crossAxisSpacing: 13),
                      itemBuilder: (context, index) {
                        return CutomCard(product: products[index]);
                      });
                }             else {
                  return Center(child: CircularProgressIndicator(color: Colors.black));
                }
                // ,Center(child: CircularProgressIndicator());
              }),
        ));
  }
}
