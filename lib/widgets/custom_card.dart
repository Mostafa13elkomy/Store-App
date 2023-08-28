import 'package:flutter/material.dart';
import 'package:store_app/Pages/update_product_page.dart';
import 'package:store_app/models/product_model.dart';

class CutomCard extends StatelessWidget {
  CutomCard({required this.product});
  productModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProduct.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  color: Color.fromARGB(255, 211, 211, 211),
                  spreadRadius: 0.5,
                  offset: Offset(5, 5))
            ]),
            height: 130,
            width: 170,
            child: Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0, 9),
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$ ' '${product.price.toString()}',
                          style: TextStyle(fontSize: 18),
                        ),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              left: 35,
              bottom: 80,
              child: Image.network(
                product.image,
                height: 77,
                width: 100,
              ))
        ],
      ),
    );
  }
}
