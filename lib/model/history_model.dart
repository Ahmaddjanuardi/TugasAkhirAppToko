import 'package:cloud_firestore/cloud_firestore.dart';

class History {
  final String id;
  final String tanggalBeli;
  final String totalHarga;

  History({
    required this.id,
    required this.tanggalBeli,
    required this.totalHarga,
  });

  Map<String, String> toMap() {
    return {"id": id, "tanggalBeli": tanggalBeli, "totalHarga": totalHarga};
  }

  static History fromSnapshot(DocumentSnapshot snap) {
    History history = History(
        id: snap.id,
        tanggalBeli: snap["tanggalBeli"],
        totalHarga: snap["totalHarga"]);
    return history;
  }

  // static List<History> history = [
  //   History(id: "id", tanggalBeli: "2023-02-07", totalHarga: "400000"),
  //   History(id: "id", tanggalBeli: "2023-02-07", totalHarga: "500000"),
  // ];
}

class DaftarBeli {
  final String id;
  final String harga;
  final String jumlah;
  final String modal;
  final String namaBarang;

  DaftarBeli(
      {required this.id,
      required this.harga,
      required this.jumlah,
      required this.modal,
      required this.namaBarang});

  Map<String, String> toMap() {
    return {
      "id": id,
      "harga": harga,
      "jumlah": jumlah,
      "modal": modal,
      "namaBarang": namaBarang
    };
  }

  static DaftarBeli fromSnapshot(DocumentSnapshot snap) {
    DaftarBeli daftarBeli = DaftarBeli(
        id: snap.id,
        harga: snap["harga"],
        jumlah: snap["jumlah"],
        modal: snap["modal"],
        namaBarang: snap["namaBarang"]);
    return daftarBeli;
  }

  // static List<DaftarBeli> daftarBeli = [
  //   DaftarBeli(
  //       harga: "400000", jumlah: "1", modal: "350000", namaBarang: "Shoes"),
  //   DaftarBeli(
  //       harga: "100000", jumlah: "5", modal: "90000", namaBarang: "T-Shirt")
  // ];
}
