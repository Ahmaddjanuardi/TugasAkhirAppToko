import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_akhir_toko/ui/home_page.dart';
import 'package:project_akhir_toko/ui/component/drop_down_menu.dart';

import 'login_page.dart';

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return UsingMainPAge();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
