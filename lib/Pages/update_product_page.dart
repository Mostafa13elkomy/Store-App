import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_botton.dart';
import 'package:store_app/widgets/custom_text_feild.dart';

class UpdateProduct extends StatefulWidget {
  UpdateProduct({super.key});
  static String id = 'update product';

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? title, desc, image, price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    productModel product =
        ModalRoute.of(context)!.settings.arguments as productModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'Update Product',
                style: TextStyle(color: Colors.black),
              )),
          body: SingleChildScrollView(
            child: Column(
              children: [
                CustomFormTextFeild(
                  onChanged: (data) {
                    title = data;
                  },
                  hintText: 'title',
                ),
                SizedBox(
                  height: 13,
                ),
                CustomFormTextFeild(
                  inputType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: 'price',
                ),
                SizedBox(
                  height: 13,
                ),
                CustomFormTextFeild(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: 'description',
                ),
                SizedBox(
                  height: 13,
                ),
                CustomFormTextFeild(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'image',
                ),
                CustomButtom(
                    onTap: () async {
                      isLoading = true;
                      setState(() {});
    
    
                        try {
                          await updateProduct(product);
                        print('success');
                      } catch (e) {
                        print(e);
                      }
                      isLoading = false;
                      setState(() {});
                    },
                    text: 'Update')
              ],
            ),
          )),
    );
  }

  Future<void> updateProduct(productModel product) async {
    await UpdateProductServices().updateProduct(
        id: product.id,
        title: title == null ? product.title : title!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
