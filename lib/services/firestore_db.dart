import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_akhir_toko/model/product_model.dart';

class FireStoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
  // FirebaseAuth auth = FirebaseAuth.instance;

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
}
