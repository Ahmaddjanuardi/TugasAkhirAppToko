import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_akhir_toko/controllers/cart_controller.dart';
import 'package:project_akhir_toko/model/product_model.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.products.length,
        itemBuilder: (BuildContext context, index) {
          return CartProductCart(
            controller: controller,
            product: controller.products.keys.toList()[index],
            quantity: controller.products.values.toList()[index],
            index: index,
          );
        },
      ),
    );
  }
}

class CartProductCart extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;

  const CartProductCart(
      {Key? key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.amber),
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
              child: Text(product.namaBarang),
            ),
            IconButton(
              onPressed: () {
                controller.removeProduct(product);
              },
              icon: const Icon(
                Icons.remove_circle,
                size: 24.0,
              ),
            ),
            Text("${quantity}"),
            IconButton(
              onPressed: () {
                controller.addProduct(product);
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
