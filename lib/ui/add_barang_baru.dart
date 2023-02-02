// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_akhir_toko/ui/style/colors.dart';

const List<String> list = <String>[
  'Category',
  'T-Shirt',
  'Pants',
  'Hodie',
  'Shoes'
];

class Add_Barang_Baru extends StatefulWidget {
  const Add_Barang_Baru({Key? key}) : super(key: key);

  @override
  State<Add_Barang_Baru> createState() => _Add_Barang_BaruState();
}

class _Add_Barang_BaruState extends State<Add_Barang_Baru> {
  String dropdownValue = list.first;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaBarang = TextEditingController();
  final TextEditingController hargaJual = TextEditingController();
  final TextEditingController hargaModal = TextEditingController();
  // final TextEditingController kategori = TextEditingController();
  final TextEditingController stockSaatIni = TextEditingController();
  final TextEditingController stockMinimum = TextEditingController();
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
                      "Kelola Stock",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ]),
            )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                height: size.height - (size.height / 5),
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(34),
                        topRight: Radius.circular(34))),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 15, top: 40),
                        child: TextFormField(
                          controller: namaBarang,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Masukkan Nama Barang";
                            }
                            return null;
                          }),
                          decoration: InputDecoration(
                              hintText: "Nama Barang",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                              labelText: 'Nama Barang',
                              labelStyle: TextStyle(
                                color: Colors.blueGrey,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10))),
                          onChanged: (value) {},
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          controller: hargaJual,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Masukkan Harga Jual";
                            }
                            return null;
                          }),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Harga Jual",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                              labelText: 'Harga Jual',
                              labelStyle: TextStyle(
                                color: Colors.blueGrey,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10))),
                          onChanged: (value) {},
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          controller: hargaModal,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Masukkan Harga Modal";
                            }
                            return null;
                          }),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Harga Modal",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                              labelText: 'Harga Modal',
                              labelStyle: TextStyle(
                                color: Colors.blueGrey,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10))),
                          onChanged: (value) {},
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                hintText: "Category",
                                labelText: "Category",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.pink, width: 2),
                                    borderRadius: BorderRadius.circular(20))),
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            onChanged: (String? value) {
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                            items: list
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            width: MediaQuery.of(context).size.width / 2 - 30,
                            child: TextFormField(
                              controller: stockSaatIni,
                              validator: ((value) {
                                if (value == null || value.isEmpty) {
                                  return "Masukkan Stock Saat Ini";
                                }
                                return null;
                              }),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "Stock Saat Ini",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  labelText: 'Stock Saat Ini',
                                  labelStyle: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.blue,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20))),
                              onChanged: (value) {},
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            width: MediaQuery.of(context).size.width / 2 - 30,
                            child: TextFormField(
                              controller: stockMinimum,
                              validator: ((value) {
                                if (value == null || value.isEmpty) {
                                  return "Masukkan Stock Minimum";
                                }
                                return null;
                              }),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "Stock Minimum",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  labelText: 'Stock Minimum',
                                  labelStyle: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.blue,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20))),
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              addData.add({
                                "namaBarang": namaBarang.text,
                                "hargaJual": int.tryParse(hargaJual.text) ?? 0,
                                "hargaModal":
                                    int.tryParse(hargaModal.text) ?? 0,
                                "kategori": dropdownValue,
                                "stockSaatIni":
                                    int.tryParse(stockSaatIni.text) ?? 0,
                                "stockMinimum":
                                    int.tryParse(stockMinimum.text) ?? 0
                              });
                              namaBarang.text = "";
                              hargaJual.text = "";
                              hargaModal.text = "";
                              dropdownValue = list.first;
                              stockSaatIni.text = "";
                              stockMinimum.text = "";
                              Navigator.of(context).pop();
                            }
                          },
                          child: const Text("Save"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
