import 'package:flutter/material.dart';
import 'package:project_akhir_toko/ui/style/colors.dart';

class Lainnya extends StatelessWidget {
  const Lainnya({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 24),
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(color: AppColors.purple),
            child: SafeArea(
                child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Akun Saya", style: TextStyle(fontSize: 30))
                    ],
                  ),
                ],
              ),
            )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              height: size.height - (size.height / 5),
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight: Radius.circular(34))),
              child: Column(children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 28.0,
                        backgroundImage: NetworkImage(
                          "https://i.ibb.co/PGv8ZzG/me.jpg",
                        ),
                      ),
                      // SizedBox(
                      //   width: 20,
                      // ),
                      Column(
                        children: [Text("NamaAkun"), Text("NoTel")],
                      ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Colors.cyanAccent.shade400,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(12),
                      //     ),
                      //   ),
                      //   onPressed: () {},
                      //   child: const Text("Update Profile"),
                      // ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.mode_edit_outline_outlined,
                          size: 30.0,
                          color: Colors.amberAccent,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Account"),
                  ],
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
