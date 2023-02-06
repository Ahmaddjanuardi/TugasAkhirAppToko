import 'package:get/get.dart';
import 'package:project_akhir_toko/model/product_model.dart';
import 'package:project_akhir_toko/services/firestore_db.dart';

class ProductController extends GetxController {
  final FireStoreDB fireStoreDB = FireStoreDB();
// Add a list of Product objects

  var products = <Product>[].obs;

  var newProduct = {}.obs;

  @override
  void onInit() {
    products.bindStream(FireStoreDB().getAllProducts());
    super.onInit();
  }

  void savaUpdateProduct(Product product, String id) {
    fireStoreDB.updateData(product, id);
  }
}
