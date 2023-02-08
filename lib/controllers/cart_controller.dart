import 'package:get/get.dart';
import 'package:project_akhir_toko/model/product_model.dart';

class CartController extends GetxController {
  // Add a dict to store the products in the cart

  var _products = {}.obs;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
    Get.snackbar(
      "Product Added",
      "You have added the ${product.namaBarang} to the cart",
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
    );
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get products => _products;

  get productSubTotal => _products.entries
      .map((product) => product.key.hargaJual * product.value)
      .toList();

  get total {
    if (_products.isNotEmpty) {
      return _products.entries
          .map((product) => int.parse(product.key.hargaJual) * product.value)
          .toList()
          .reduce((value, element) => value + element)
          .toString();
    } else {
      return '0';
    }
  }

  get modal {
    if (_products.isNotEmpty) {
      return _products.entries
          .map((product) => int.parse(product.key.hargaModal) * product.value)
          .toList()
          .reduce((value, element) => value + element)
          .toString();
    } else {
      return '0';
    }
  }

  get keuntungan {
    if (_products.isNotEmpty) {
      return _products.entries
          .map((product) =>
              int.parse(product.key.hargaJual) -
              int.parse(product.key.hargaModal))
          .toList()
          .reduce((value, element) => value + element)
          .toString();
    } else {
      return '0';
    }
  }
}
