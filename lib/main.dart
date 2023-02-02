import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_akhir_toko/firebase_options.dart';
import 'package:project_akhir_toko/ui/main_page.dart';
import 'package:project_akhir_toko/ui/login_page.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
