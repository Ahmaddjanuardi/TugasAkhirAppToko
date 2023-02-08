import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_akhir_toko/model/history_model.dart';
import 'package:project_akhir_toko/model/product_model.dart';

class FireStoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addData(Product productModel) {
    return _firebaseFirestore.collection("product").add(productModel.toMap());
  }

  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore.collection("product").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }

  Future<void> updateData(Product updatedProduct, String id) {
    return _firebaseFirestore
        .collection("product")
        .doc(id)
        .update(updatedProduct.toMap());
    // .get().then(
    //       (QuerySnapshot) => {QuerySnapshot.get()},
    // );
  }

  Future<void> deleteProduct(Product deletedProduct, String id) {
    return _firebaseFirestore.collection("product").doc(id).delete();
  }

  Stream<List<History>> getAllHistory() {
    return _firebaseFirestore.collection("history").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => History.fromSnapshot(doc)).toList();
    });
  }

  Future<void> addHistory(History historyModel) {
    return _firebaseFirestore.collection("history").add(historyModel.toMap());
  }

  Future<void> addSubHistory(DaftarBeli daftarBeliModel, String id) {
    return _firebaseFirestore
        .collection("history")
        .doc(id)
        .collection("daftarBeli")
        .add(daftarBeliModel.toMap());
  }
}
