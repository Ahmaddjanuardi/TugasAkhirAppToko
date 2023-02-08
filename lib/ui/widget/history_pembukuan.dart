import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:project_akhir_toko/controllers/history_controller.dart';
import 'package:project_akhir_toko/main.dart';

class HistoryPembukuan extends StatelessWidget {
  final historyController = Get.put(HistoryController());

  HistoryPembukuan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
          itemCount: historyController.history.length,
          itemBuilder: (BuildContext context, int index) {
            return HistoryPembukuancard(index: index);
          },
        ),
      ),
    );
  }
}

class HistoryPembukuancard extends StatelessWidget {
  final HistoryController historyController = Get.find();
  final int index;
  HistoryPembukuancard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 20),
      child: GestureDetector(
        onTap: () {
          Get.toNamed('/DetailHistory',
              parameters: {"id": historyController.history[index].id});
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.amber),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                      "Tanggal Pencatatan : ${historyController.history[index].tanggalBeli}"),
                ],
              ),
              Row(
                children: [
                  Text(
                      "Total Harga Product : ${historyController.history[index].totalHarga}"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
