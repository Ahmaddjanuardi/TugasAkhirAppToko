import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_akhir_toko/controllers/cart_controller.dart';
import 'package:project_akhir_toko/model/product_model.dart';

import '../../controllers/product_controller.dart';

class CartProducts extends StatelessWidget {
  final Function addProductState;
  CartProducts({Key? key, required this.addProductState}) : super(key: key);

  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.products.length,
        itemBuilder: (BuildContext context, index) {
          return CartProductCart(
            product: controller.products.keys.toList()[index],
            detail: controller.products.values.toList()[index],
            index: index,
            addProductState: addProductState,
          );
        },
      ),
    );
  }
}

class CartProductCart extends StatelessWidget {
  final Function addProductState;
  final String product;
  final Map<String, dynamic> detail;
  final int index;

  CartProductCart(
      {Key? key,
      required this.product,
      required this.detail,
      required this.index,
      required this.addProductState})
      : super(key: key);

  final ProductController productController = Get.find();

  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.amber),
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            // CircleAvatar(
            //   radius: 28.0,
            //   child: Text("${Product.product[index].namaBarang[0]}"),
            // ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(product),
            ),
            IconButton(
              onPressed: () {
                // controller.removeProduct(product);
              },
              icon: const Icon(
                Icons.remove_circle,
                size: 24.0,
              ),
            ),
            Text("${cartController.products[product]['jumlah']}"),
            IconButton(
              onPressed: () {
                cartController.addProduct(productController.products
                    .firstWhere((element) => element.namaBarang == product));
                addProductState();
                // print(widget.controller.products[widget.product]);
              },
              icon: const Icon(
                Icons.add_circle,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
