import 'package:cp_groceries/common_widget/product_cell.dart';
import 'package:cp_groceries/view/explore/filter_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extensions.dart';

class ExploreDetailView extends StatefulWidget {
  final Map eObj;
  const ExploreDetailView({super.key, required this.eObj});

  @override
  State<ExploreDetailView> createState() => _ExploreDetailViewState();
}

class _ExploreDetailViewState extends State<ExploreDetailView> {
  List listArr = [
    {
      "name": "Diet Coke",
      "icon": "assets/img/diet_coke.png",
      "qty": "355",
      "unit": "ml, Price",
      "price": "\$1.99",
    },
    {
      "name": "Sprite Can",
      "icon": "assets/img/sprite_can.png",
      "qty": "355",
      "unit": "ml, Price",
      "price": "\$1.49",
    },
    {
      "name": "Apple & Grape Juice",
      "icon": "assets/img/juice_apple_grape.png",
      "qty": "2",
      "unit": "L, Price",
      "price": "\$15.99",
    },
    {
      "name": "Orange Juice",
      "icon": "assets/img/orenge_juice.png",
      "qty": "2",
      "unit": "L, Price",
      "price": "\$4.99",
    },
    {
      "name": "Coca Cola Can",
      "icon": "assets/img/cocacola_can.png",
      "qty": "234",
      "unit": "ml, Price",
      "price": "\$4.99",
    },
    {
      "name": "Pepsi Can",
      "icon": "assets/img/pepsi_can.png",
      "qty": "150",
      "unit": "ml, Price",
      "price": "\$4.99",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/img/back.png",
            width: 20,
            height: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FilterView(),
                ),
              );
            },
            icon: Image.asset(
              "assets/img/filter_ic.png",
              width: 20,
              height: 20,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.eObj["name"].toString(),
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.71,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15),
        itemCount: listArr.length,
        itemBuilder: ((context, index) {
          var pObj = listArr[index] as Map? ?? {};

          return ProductCell(
            pObj: pObj,
            onPressed: () {},
            onCart: () {},
            weight: double.maxFinite,
            margin: 0,
          );
        }),
      ),
    );
  }
}
