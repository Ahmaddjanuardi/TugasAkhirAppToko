import 'package:get/get.dart';
import 'package:project_akhir_toko/model/history_model.dart';
import 'package:project_akhir_toko/services/firestore_db.dart';

class HistoryController extends GetxController {
  final FireStoreDB fireStoreDB = FireStoreDB();

  var history = <History>[].obs;

  var newHistory = {}.obs;

  @override
  void onInit() {
    history.bindStream(FireStoreDB().getAllHistory());
    super.onInit();
  }
}
