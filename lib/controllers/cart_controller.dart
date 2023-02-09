import 'package:get/get.dart';
import 'package:project_akhir_toko/model/product_model.dart';

class CartController extends GetxController {
  // Add a dict to store the products in the cart

  var _products = {}.obs;

  void addProduct(Product product) {
    var newProduct = {
      "id": product.id,
      "harga": product.hargaJual,
      "jumlah": 1,
      "modal": product.hargaModal,
      "namaBarang": product.namaBarang
    };
    // _products[newProduct['namaBarang']]
    if (_products.containsKey(newProduct['namaBarang'])) {
      _products[newProduct['namaBarang']]['jumlah']++;
    } else {
      newProduct['jumlah'] = 1;
      _products[product.namaBarang] = newProduct;
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
          .map((product) =>
              int.parse(product.value['harga']) * product.value['jumlah'])
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
          .map((product) =>
              int.parse(product.value['modal']) * product.value['jumlah'])
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
              int.parse(product.value['harga']) -
              int.parse(product.value['modal']))
          .toList()
          .reduce((value, element) => value + element)
          .toString();
    } else {
      return '0';
    }
  }

  get productKeys {
    return _products.keys.toList();
  }

  get productLength {
    return _products.keys.toList().length;
  }

  get productValues {
    return _products.values.toList();
  }
}
