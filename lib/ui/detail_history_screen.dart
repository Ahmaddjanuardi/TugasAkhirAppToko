import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_akhir_toko/ui/style/colors.dart';
import 'package:project_akhir_toko/ui/widget/detail_history.dart';

class DetailHistory extends StatelessWidget {
  final String itemId;
  const DetailHistory({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    // CollectionReference detailHistory = firestore.collection("")
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
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 24.0,
                      ),
                    ),
                    Text(
                      "Detail Transaksi",
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              height: size.height - (size.height / 5),
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight: Radius.circular(34))),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.cyan.shade400),
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text("Penjualan"), Text("data")],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text("Harga Modal"), Text("data")],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text("Keuntungan"), Text("data")],
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DetailHistoryPembukuancard(
                    itemId: itemId,
                  )
                  // Container(
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15),
                  //       color: Colors.cyan.shade400),
                  //   height: 300,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //         children: [
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [Text("Tanggal"), Text("data")],
                  //           ),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Column(
                  //                 children: [
                  //                   Text("namaBarang"),
                  //                   Text("harga/pcs"),
                  //                 ],
                  //               ),
                  //               Text("jumlahBeli"),
                  //               Text("totalPerItem")
                  //             ],
                  //           ),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Text("Total"),
                  //               Text("Rp "),
                  //             ],
                  //           ),
                  //         ]),
                  //   ),
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
