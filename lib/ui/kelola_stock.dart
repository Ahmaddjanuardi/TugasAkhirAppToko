// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_akhir_toko/ui/add_barang_baru.dart';
import 'package:project_akhir_toko/ui/component/tab_bar.dart';
import 'package:project_akhir_toko/ui/style/colors.dart';

class KelolaStock extends StatefulWidget {
  const KelolaStock({Key? key}) : super(key: key);

  @override
  State<KelolaStock> createState() => _KelolaStockState();
}

class _KelolaStockState extends State<KelolaStock> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference addData = firestore.collection('addData');
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
                              Navigator.pop(context);
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
                                  StreamBuilder<QuerySnapshot>(
                                    stream: addData.snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return SingleChildScrollView(
                                          controller: ScrollController(),
                                          child: Column(
                                              children: snapshot.data!.docs
                                                  .map((e) => Container(
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        width: double.infinity,
                                                        height: 150,
                                                        padding:
                                                            EdgeInsets.all(25),
                                                        decoration: BoxDecoration(
                                                            color:
                                                                AppColors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        14)),
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              SizedBox(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    CircleAvatar(
                                                                      child: Text(e["namaBarang"] ==
                                                                              ""
                                                                          ? "A"
                                                                          : "${e["namaBarang"][0]}"),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          15,
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        Text(e[
                                                                            "namaBarang"]),
                                                                        Text(
                                                                            "Harga Jual : ${e["hargaJual"]} / Item"),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),

                                                              // Column(
                                                              //   mainAxisAlignment:
                                                              //       MainAxisAlignment
                                                              //           .spaceAround,
                                                              //   children: [
                                                              //     Text(e[
                                                              //         "namaBarang"]),
                                                              //     Text(
                                                              //         "Harga Jual : ${e["hargaJual"]} per item"),
                                                              //   ],
                                                              // ),
                                                              SizedBox(
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    OutlinedButton(
                                                                      style: OutlinedButton
                                                                          .styleFrom(
                                                                        foregroundColor:
                                                                            Colors.blueGrey,
                                                                      ),
                                                                      onPressed:
                                                                          () {},
                                                                      child: const Text(
                                                                          "Atur Stock"),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Text("Stock: " +
                                                                        e["stockSaatIni"]
                                                                            .toString()),
                                                                  ],
                                                                ),
                                                              )
                                                            ]),
                                                      ))
                                                  .toList()),
                                        );
                                      } else {
                                        return Text("Loading");
                                      }
                                    },
                                  ),
                                  SingleChildScrollView(),
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
