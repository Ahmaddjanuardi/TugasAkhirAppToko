import 'package:flutter/material.dart';
import 'package:project_akhir_toko/ui/widget/daftar_pembukuan.dart';
import 'package:project_akhir_toko/ui/style/colors.dart';
import 'package:get/get.dart';

class DaftarPembukuan extends StatelessWidget {
  const DaftarPembukuan({super.key});

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
              child: Column(children: [CatalogProducts()]),
            ),
          )
        ],
      ),
    );
  }
}
