import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_akhir_toko/ui/detail_history_screen.dart';
import 'package:project_akhir_toko/ui/style/colors.dart';
import 'package:project_akhir_toko/ui/widget/history_pembukuan.dart';

class Pembukuan extends StatelessWidget {
  const Pembukuan({super.key});

  @override
  Widget build(BuildContext context) {
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // CollectionReference history = firestore.collection("history");
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
                    Text(
                      "History Transaksi",
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
                  topRight: Radius.circular(34),
                ),
              ),
              child: Container(
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.amber),
                        height: size.height / 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Penjualan"),
                                  Text("Pengeluaran")
                                ],
                              ),
                              Row(
                                children: [Text("Untung")],
                              ),
                            ],
                          ),
                        )),
                    HistoryPembukuan()

                    // StreamBuilder<QuerySnapshot>(
                    //   stream: history.snapshots(),
                    //   builder: (context, snapshot) {
                    //     if (snapshot.hasData) {
                    //       return Container(
                    //         child: ListView.builder(
                    //           shrinkWrap: true,
                    //           itemCount: snapshot.data!.docs.length,
                    //           itemBuilder: (context, index) {
                    //             DocumentSnapshot history =
                    //                 snapshot.data!.docs[index];

                    //             return Padding(
                    //               padding: EdgeInsets.all(2),
                    //               child: GestureDetector(
                    //                 onTap: () {
                    //                   Get.toNamed("/DetailHistory",
                    //                       parameters: {
                    //                         "id": snapshot.data!.docs[index].id,
                    //                         "tanggalBeli":
                    //                             history["tanggalBeli"]
                    //                       });
                    //                   print(snapshot.data!.docs[index].id);
                    //                 },
                    //                 child: Card(
                    //                   color: Colors.blue,
                    //                   shape: RoundedRectangleBorder(
                    //                       borderRadius:
                    //                           BorderRadius.circular(20)),
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.all(8.0),
                    //                     child: Column(
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.start,
                    //                       children: [
                    //                         Text(
                    //                           "Tanggal Pembelian : ${history['tanggalBeli']}",
                    //                           style: const TextStyle(
                    //                             color: Color(0xFFF1C950),
                    //                             fontFamily: "Inter",
                    //                             fontSize: 17,
                    //                             fontWeight: FontWeight.normal,
                    //                             letterSpacing: 1,
                    //                           ),
                    //                         ),
                    //                         Text(
                    //                           "Total Harga :  ${history['totalHarga']}",
                    //                           style: const TextStyle(
                    //                             color: Color(0xFFF1C950),
                    //                             fontFamily: "Inter",
                    //                             fontSize: 17,
                    //                             fontWeight: FontWeight.normal,
                    //                             letterSpacing: 1,
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             );
                    //           },
                    //         ),
                    //       );
                    //     } else {
                    //       return Text("Loading");
                    //     }
                    //   },
                    // )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
