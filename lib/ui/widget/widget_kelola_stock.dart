import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_akhir_toko/controllers/cart_controller.dart';
import 'package:project_akhir_toko/controllers/product_controller.dart';
import 'package:project_akhir_toko/ui/updateProduct.dart';
// import 'package:project_akhir_toko/model/product_model.dart';

class CatalogKelolaStock extends StatelessWidget {
  final productController = Get.put(ProductController());
  CatalogKelolaStock({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (BuildContext context, int index) {
            return CatalogProductCard(index: index);
          },
        ),
      ),
    );
  }
}

class CatalogProductCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  final ProductController productController = Get.find();
  final int index;
  CatalogProductCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.amber),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              child: Text("${productController.products[index].namaBarang[0]}"),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productController.products[index].namaBarang,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                    "Harga Jual : ${productController.products[index].hargaJual}")
              ],
            )),
            // Expanded(
            //     child: ),
            Expanded(
                child: Column(
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.green,
                    side: const BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => UpdateStock(
                          product: productController.products[index],
                        ));
                  },
                  child: const Text("Edit Barang"),
                ),
                Text(
                    "Stock  : ${productController.products[index].stockSaatIni}"),
              ],
            )),
            // IconButton(
            //   onPressed: () {
            //     cartController.addProduct(productController.products[index]);
            //   },
            //   icon: const Icon(
            //     Icons.add_circle,
            //     size: 24.0,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
