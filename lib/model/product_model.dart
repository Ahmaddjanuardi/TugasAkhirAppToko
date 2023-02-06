import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String namaBarang;
  final String hargaJual;
  final String hargaModal;
  final String kategori;
  final String stockSaatIni;
  final String stockMinimum;

  const Product(
      {required this.id,
      required this.namaBarang,
      required this.hargaJual,
      required this.hargaModal,
      required this.kategori,
      required this.stockSaatIni,
      required this.stockMinimum});

  Map<String, String> toMap() {
    return {
      "id": id,
      "namaBarang": namaBarang,
      "hargaJual": hargaJual,
      "hargaModal": hargaModal,
      "kategori": kategori,
      "stockSaatIni": stockSaatIni,
      "stockMinimum": stockMinimum
    };
  }

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      id: snap.id,
      namaBarang: snap["namaBarang"],
      hargaJual: snap["hargaJual"],
      hargaModal: snap["hargaModal"],
      kategori: snap["kategori"],
      stockSaatIni: snap["stockSaatIni"],
      stockMinimum: snap["stockMinimum"],
    );
    return product;
  }

  // static const List<Product> products = [
  //   Product(
  //       namaBarang: "Sepatu Saya",
  //       hargaJual: "200000",
  //       hargaModal: "150000",
  //       kategori: "Shoes",
  //       stockSaatIni: "20",
  //       stockMinimum: "1"),
  //   Product(
  //       namaBarang: "Jeans",
  //       hargaJual: "300000",
  //       hargaModal: "150000",
  //       kategori: "Jeans",
  //       stockSaatIni: "30",
  //       stockMinimum: "2")
  // ];
}
