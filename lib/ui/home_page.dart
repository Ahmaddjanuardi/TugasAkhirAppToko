// import 'package:carousel_slider/carousel_slider.dart';
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:project_akhir_toko/ui/component/bottomNavigationBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_akhir_toko/ui/catat_pembukuan.dart';
import 'package:project_akhir_toko/ui/component/item_category.dart';
import 'package:project_akhir_toko/ui/kelola_stock.dart';
import 'package:project_akhir_toko/ui/lainnya_page.dart';
import 'package:project_akhir_toko/ui/pembukuan.dart';
import 'package:project_akhir_toko/ui/style/colors.dart';

import 'component/carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.purple,
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(
      //         Icons.notifications,
      //         size: 24.0,
      //       ),
      //     ),
      //     IconButton(
      //       onPressed: () {
      //         FirebaseAuth.instance.signOut();
      //       },
      //       icon: const Icon(
      //         Icons.logout,
      //         size: 24.0,
      //       ),
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24)),
                    color: AppColors.purple),
                width: double.infinity,
                height: 290,
                // color: AppColors.purple,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications,
                            size: 24.0,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                          },
                          icon: const Icon(
                            Icons.logout,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: AppColors.pink,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Row(children: [
                                Text(
                                  "ToKo Ku",
                                  style: TextStyle(fontSize: 25.0),
                                ),
                              ]),
                            ),
                            SizedBox(
                              child: Column(
                                children: [
                                  Text(
                                    "Total Saldo",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "Rp. 20.000.000",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.blue,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Image.network(
                                                "https://cdn-icons-png.flaticon.com/512/5949/5949926.png",
                                                width: 64.0,
                                                height: 64.0,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            // Text("Bayar"),
                                          ),
                                          Text("Bayar"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Image.network(
                                                "https://cdn-icons-png.flaticon.com/512/3135/3135706.png",
                                                width: 64.0,
                                                height: 64.0,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Text("Tagih"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Image.network(
                                                "https://cdn-icons-png.flaticon.com/512/9359/9359442.png",
                                                width: 64.0,
                                                height: 64.0,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Text("QRIS"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ]),
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                  ],
                )),
            Expanded(
                child: Container(
              // padding: EdgeInsets.symmetric(vertical: 20),
              color: Colors.white30,
              child: LayoutBuilder(
                builder: (p0, p1) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: p1.maxHeight),
                        child: IntrinsicHeight(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0)),
                                  color: Colors.white,
                                ),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Fitur Andalan Kamu",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: SizedBox(
                                            child: Column(children: [
                                              CircleAvatar(
                                                backgroundColor: Colors.white,
                                                child: Image.network(
                                                  "https://cdn-icons-png.flaticon.com/512/2422/2422792.png",
                                                  width: 64.0,
                                                  height: 64.0,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Text("Laporan Usaha"),
                                            ]),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CatatPembukuan(),
                                              ),
                                            );
                                          },
                                          child: SizedBox(
                                            child: Column(children: [
                                              CircleAvatar(
                                                backgroundColor: Colors.white,
                                                child: Image.network(
                                                  "https://cdn-icons-png.flaticon.com/512/4149/4149651.png",
                                                  width: 64.0,
                                                  height: 64.0,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Text("Catat Pembukuan"),
                                            ]),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    KelolaStock(),
                                              ),
                                            );
                                          },
                                          child: SizedBox(
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    child: Image.network(
                                                      "https://cdn-icons-png.flaticon.com/512/2825/2825867.png",
                                                      width: 64.0,
                                                      height: 64.0,
                                                      fit: BoxFit.fill,
                                                    )),
                                                Text("Kelola Stock"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: SizedBox(
                                            child: Column(children: [
                                              CircleAvatar(
                                                backgroundColor: Colors.white,
                                                child: Image.network(
                                                  "https://cdn-icons-png.flaticon.com/512/4689/4689923.png",
                                                  width: 64.0,
                                                  height: 64.0,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Text("Mode Kasir"),
                                            ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Carousel(),
                              ItemCategory()
                            ],
                          ),
                        )),
                  );
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class UsingMainPAge extends StatefulWidget {
  const UsingMainPAge({Key? key}) : super(key: key);

  @override
  State<UsingMainPAge> createState() => _UsingMainPAgeState();
}

class _UsingMainPAgeState extends State<UsingMainPAge> {
  @override
  int pageIndex = 0;

  final pages = [
    const HomePage(),
    const Pembukuan(),
    const Lainnya(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[pageIndex], bottomNavigationBar: buildMyNavBar(context));
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(20),
        //   topRight: Radius.circular(20),
        // ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            child: Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: pageIndex == 0
                      ? const FaIcon(
                          FontAwesomeIcons.house,
                          color: AppColors.purple,
                          size: 35,
                        )
                      : const FaIcon(
                          FontAwesomeIcons.house,
                          color: Colors.grey,
                          size: 35,
                        ),
                ),
                Text("Beranda")
              ],
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      setState(() {
                        pageIndex = 1;
                      });
                    },
                    icon: pageIndex == 1
                        ? const FaIcon(
                            FontAwesomeIcons.book,
                            color: AppColors.purple,
                            size: 35,
                          )
                        : const FaIcon(
                            FontAwesomeIcons.book,
                            color: Colors.grey,
                            size: 35,
                          )),
                Text("Pembukuan")
              ],
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      setState(() {
                        pageIndex = 2;
                      });
                    },
                    icon: pageIndex == 2
                        ? const FaIcon(
                            FontAwesomeIcons.ellipsis,
                            color: AppColors.purple,
                            size: 35,
                          )
                        : const FaIcon(
                            FontAwesomeIcons.ellipsis,
                            color: Colors.grey,
                            size: 35,
                          )),
                Text("Lainnya")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
