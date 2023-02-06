import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_akhir_toko/controllers/cart_controller.dart';
import 'package:project_akhir_toko/ui/widget/cart_products.dart';
import 'package:project_akhir_toko/ui/widget/cart_total.dart';
import 'package:project_akhir_toko/ui/daftar_product_pembukuan.dart';
import 'package:project_akhir_toko/ui/style/colors.dart';
import 'package:get/get.dart';

class CatatPembukuan extends StatelessWidget {
  CatatPembukuan({Key? key}) : super(key: key);
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 24),
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(color: AppColors.purple),
            child: SafeArea(
                child: Align(
              alignment: Alignment.topCenter,
              child: Column(children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 24.0,
                      ),
                    ),
                    Text(
                      "Catat Pembukuan",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ]),
            )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
                                text: "Pemasukan",
                              ),
                              Tab(
                                text: "Pengeluaran",
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
                                        SizedBox(
                                          height: constraints.maxHeight * 0.15,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("Barang Terjual"),
                                              ElevatedButton.icon(
                                                icon: const Icon(Icons.add),
                                                label:
                                                    const Text("Tambah Barang"),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      AppColors.blue,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const DaftarPembukuan()));
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: constraints.maxHeight * 0.05,
                                        ),
                                        SizedBox(
                                            height: constraints.maxHeight * 0.6,
                                            child: CartProducts()),
                                        SizedBox(
                                            height: constraints.maxHeight * 0.2,
                                            child: CartTotal()),
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
                )),
          )
        ],
      ),
    );
  }
}
