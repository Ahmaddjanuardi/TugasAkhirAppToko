import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:project_akhir_toko/model/history_model.dart';
import 'package:flutter/material.dart';

// class DetailHistoryPembukuan extends StatelessWidget {
//   const DetailHistoryPembukuan({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       child: ListView.builder(
//         itemCount: DaftarBeli.daftarBeli.length,
//         itemBuilder: (BuildContext context, int index) {
//           return DetailHistoryPembukuancard(index: index);
//         },
//       ),
//     );
//   }
// }

class DetailHistoryPembukuancard extends StatelessWidget {
  final String itemId;
  DetailHistoryPembukuancard({Key? key, required this.itemId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // CollectionReference detailHistory =
    //     firestore.collection("history/$itemId/daftarBeli");
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("history/$itemId/daftarBeli")
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var history = snapshot.data!.docs;
          return StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("history").snapshots(),
            builder: (context, snap) {
              if (snap.hasData) {
                var data = snap.data!.docs
                    .firstWhere((element) => element.id == itemId);
                // return Text(data);
                // if (snap.hasData) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.cyan.shade400),
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Tanggal"),
                              Text(data['tanggalBeli'])
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  for (var i = 0; i < history.length; i++)
                                    Text(history[i]['namaBarang']),
                                  // Text("harga/pcs"),
                                ],
                              ),
                              Column(
                                children: [
                                  for (var i = 0; i < history.length; i++)
                                    Text(history[i]['jumlah']),
                                ],
                              ),
                              Column(
                                children: [
                                  for (var i = 0; i < history.length; i++)
                                    Text(history[i]['harga']),
                                ],
                              )

                              // Text(DaftarBeli.daftarBeli[0].harga)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total"),
                              Text(data["totalHarga"]),
                              // Text("Rp ${DaftarBeli.daftarBeli[0].harga}"),
                            ],
                          ),
                        ]),
                  ),
                );
                // } else {
                //   return Text("loading");
                // }
              } else {
                return Container();
              }
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
