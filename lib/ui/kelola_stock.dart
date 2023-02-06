// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project_akhir_toko/controllers/cart_controller.dart';
import 'package:project_akhir_toko/ui/add_barang_baru_screen.dart';
import 'package:project_akhir_toko/ui/widget/widget_kelola_stock.dart';
// import 'package:project_akhir_toko/ui/widget/cart_products.dart';
// import 'package:project_akhir_toko/ui/component/tab_bar.dart';
import 'package:project_akhir_toko/ui/style/colors.dart';

class KelolaStock extends StatelessWidget {
  KelolaStock({Key? key}) : super(key: key);
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(children: [
          Container(
            padding: const EdgeInsets.only(left: 24),
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(color: AppColors.purple),
            child: SafeArea(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 24.0,
                            ),
                          ),
                          Text(
                            "Kelola Stock",
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  height: size.height - (size.height / 5),
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(34),
                          topRight: Radius.circular(34))),
                  child: LayoutBuilder(
                    builder: (_, constraints) {
                      return DefaultTabController(
                        length: 2,
                        child: Column(
                          children: [
                            TabBar(
                              labelColor: Colors.black,
                              tabs: [
                                Tab(
                                  text: "Semua Barang",
                                ),
                                Tab(
                                  text: "Stock Menipis",
                                ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  LayoutBuilder(
                                    builder: (_, constraints) {
                                      return Column(
                                        children: [
                                          // SizedBox(
                                          //   height:
                                          //       constraints.maxHeight * 0.05,
                                          // ),
                                          // SizedBox(
                                          //     height:
                                          //         constraints.maxHeight * 0.6,
                                          //     child: CatalogKelolaStock()),
                                          CatalogKelolaStock()
                                        ],
                                      );
                                    },
                                  ),
                                  const Icon(
                                    Icons.developer_board,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )))
        ]),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColors.blue,
          foregroundColor: Colors.black,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Add_Barang_Baru(),
                ));
          },
          icon: Icon(Icons.add),
          label: Text("TAMBAH BARANG"),
        ));
  }
}
