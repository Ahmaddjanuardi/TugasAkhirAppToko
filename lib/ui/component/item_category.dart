import 'package:flutter/material.dart';

class ItemCategory extends StatefulWidget {
  const ItemCategory({super.key});

  @override
  State<ItemCategory> createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Category :",
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    child: Container(
                      child: Image.network(
                        "https://images.unsplash.com/photo-1627225924765-552d49cf47ad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHQlMjBzaGlydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1000&q=60",
                        fit: BoxFit.fitWidth,
                      ),
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    child: Container(
                      child: Image.network(
                        "https://storage.sg.content-cdn.io/cdn-cgi/image/width=542,height=723,quality=75,format=auto,fit=cover,g=top/in-resources/ff5c6da1-2d74-4846-96c9-ccd65d766244/Images/ProductImages/Source/levis-mens-501-54-jeans-A46770006_14_Details.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    child: Container(
                      child: Image.network(
                        "https://images.tokopedia.net/img/cache/500-square/VqbcmM/2022/1/19/af3922ec-44ac-4b56-a8c9-5f71a06d6a65.jpg?ect=4g",
                        fit: BoxFit.fitWidth,
                      ),
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    child: Container(
                      child: Image.network(
                        "https://images.tokopedia.net/img/cache/500-square/product-1/2015/8/11/542429/542429_68dc5610-3fd8-11e5-888d-de6887772fba.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
