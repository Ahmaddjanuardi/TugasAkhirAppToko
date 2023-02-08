import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_akhir_toko/firebase_options.dart';
import 'package:project_akhir_toko/ui/catat_pembukuan.dart';
import 'package:project_akhir_toko/ui/detail_history_screen.dart';
import 'package:project_akhir_toko/ui/kelola_stock.dart';
import 'package:project_akhir_toko/ui/laporan_usaha.dart';
import 'package:project_akhir_toko/ui/main_page.dart';
import 'package:project_akhir_toko/ui/login_page.dart';
import 'package:project_akhir_toko/ui/updateProduct.dart';
// import 'package:project_akhir_toko/ui/style/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      getPages: [
        GetPage(
          name: "/laporanUsaha",
          page: () => const LaporanUsaha(),
        ),
        GetPage(
          name: "/CatatPembukuan",
          page: () => CatatPembukuan(),
        ),
        GetPage(
          name: "/KelolaStock",
          page: () => KelolaStock(),
        ),
        GetPage(
          name: "/DetailHistory",
          page: () {
            var itemId = Get.parameters["id"];
            return DetailHistory(itemId: itemId!);
          },
        )
      ],
    );
  }
}
