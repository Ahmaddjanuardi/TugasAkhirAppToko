// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_akhir_toko/ui/style/colors.dart';

class DaftarPembukuan extends StatefulWidget {
  const DaftarPembukuan({Key? key}) : super(key: key);

  @override
  State<DaftarPembukuan> createState() => _DaftarPembukuanState();
}

class _DaftarPembukuanState extends State<DaftarPembukuan> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference addData = firestore.collection('addData');
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
                      "Daftar Barang",
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
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey[400]!,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.search),
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: null,
                          decoration: const InputDecoration.collapsed(
                            filled: true,
                            fillColor: Colors.transparent,
                            hintText: "Cari Barang",
                            hoverColor: Colors.transparent,
                          ),
                          onFieldSubmitted: (value) {},
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.sort,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: addData.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        controller: ScrollController(),
                        child: Column(
                            children: snapshot.data!.docs.map((e) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            width: double.infinity,
                            height: 150,
                            padding: EdgeInsets.all(25),
                            decoration: BoxDecoration(
                                color: AppColors.green,
                                borderRadius: BorderRadius.circular(14)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    child:
                                        // CircleAvatar(
                                        //   child: Text(e[
                                        //               "namaBarang"] ==
                                        //           ""
                                        //       ? "A"
                                        //       : "${e["namaBarang"][0]}"),
                                        // ),

                                        // SizedBox(
                                        //   height: 15,
                                        // ),
                                        Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: isChecked,
                                              onChanged: (value) {
                                                setState(() {});
                                                // isChecked = !value!;
                                              },
                                            ),
                                            Text(e["namaBarang"]),
                                          ],
                                        ),
                                        Text(
                                            "Harga Jual : ${e["hargaJual"]} / Item"),
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor: Colors.blueGrey,
                                          ),
                                          onPressed: () {},
                                          child: const Text("Atur Stock"),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Stock: " +
                                            e["stockSaatIni"].toString()),
                                      ],
                                    ),
                                  )
                                ]),
                          );
                        }).toList()),
                      );
                    } else {
                      return Text("Loading");
                    }
                  },
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
