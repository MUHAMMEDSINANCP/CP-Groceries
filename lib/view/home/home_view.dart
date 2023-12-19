import 'package:cp_groceries/view/home/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:cp_groceries/common_widget/product_cell.dart';
import 'package:cp_groceries/common_widget/section_view.dart';
import '../../common/color_extensions.dart';
import '../../common_widget/category_cell.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController txtSearch = TextEditingController();
  String userLocation = '';
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        setState(() {
          userLocation = placemarks.first.subLocality ?? '';
        });
      } catch (e) {
        // ignore: avoid_print
        print("Error getting user's location: $e");
        setState(() {
          userLocation = 'Unknown';
        });
      }
    } else {
      // Handle the case where the user denies access to location
      setState(() {
        userLocation = 'Permission Denied';
      });
    }
  }

  List exclusiveOfferArr = [
    {
      "name": "Organic Bananas",
      "icon": "assets/img/banana.png",
      "qty": "7",
      "unit": "pcs, Prices",
      "price": "\$1.99"
    },
    {
      "name": "Red Apple",
      "icon": "assets/img/apple.png",
      "qty": "1",
      "unit": "kg, Prices",
      "price": "\$4.99"
    },
    {
      "name": "Organic Bananas",
      "icon": "assets/img/banana.png",
      "qty": "7",
      "unit": "pcs, Prices",
      "price": "\$1.99"
    },
    {
      "name": "Red Apple",
      "icon": "assets/img/apple.png",
      "qty": "1",
      "unit": "kg, Prices",
      "price": "\$4.99"
    },
  ];

  List bestSellingArr = [
    {
      "name": "Bell Pepper Red",
      "icon": "assets/img/bell_pepper_red.png",
      "qty": "1",
      "unit": "kg, Prices",
      "price": "\$2.99"
    },
    {
      "name": "Ginger",
      "icon": "assets/img/ginger.png",
      "qty": "250",
      "unit": "gm, Prices",
      "price": "\$3.99"
    },
    {
      "name": "Bell Pepper Red",
      "icon": "assets/img/bell_pepper_red.png",
      "qty": "1",
      "unit": "kg, Prices",
      "price": "\$2.99"
    },
  ];

  List groceriesArr = [
    {
      "name": "Pulses",
      "icon": "assets/img/pulses.png",
      "color": const Color(0xffF8A44C),
    },
    {
      "name": "Rice",
      "icon": "assets/img/rice.png",
      "color": const Color(0xff53B175),
    },
  ];

  List listArr = [
    {
      "name": "Beef Bone",
      "icon": "assets/img/beef_bone.png",
      "qty": "1",
      "unit": "kg, Prices",
      "price": "\$4.99"
    },
    {
      "name": "Broiler Chicken",
      "icon": "assets/img/broiler_chicken.png",
      "qty": "1",
      "unit": "kg, Prices",
      "price": "\$4.99"
    },
  ];
  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/img/color_logo.png",
                    width: 25,
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/img/location.png",
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    userLocation.isNotEmpty ? userLocation : 'Unknown',
                    style: TextStyle(
                      color: TColor.darkGray,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xffF2F3F2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: txtSearch,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Image.asset(
                          "assets/img/search.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Search Store",
                      hintStyle: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.maxFinite,
                  height: 115,
                  decoration: BoxDecoration(
                    color: const Color(0xffF2F3F2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/img/banner_top.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SectionView(
                title: "Exclusive Offer",
                onPressed: () {},
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
              SizedBox(
                height: 230,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    var pObj = exclusiveOfferArr[index] as Map? ?? {};
                    return ProductCell(
                        pObj: pObj,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductDetails(),
                            ),
                          );
                        },
                        onCart: () {});
                  },
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: exclusiveOfferArr.length,
                ),
              ),
              SectionView(
                title: "Best Selling",
                onPressed: () {},
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
              SizedBox(
                height: 230,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    var pObj = bestSellingArr[index] as Map? ?? {};
                    return ProductCell(
                        pObj: pObj,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductDetails(),
                            ),
                          );
                        },
                        onCart: () {});
                  },
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: bestSellingArr.length,
                ),
              ),
              SectionView(
                title: "Groceries",
                onPressed: () {},
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    var pObj = groceriesArr[index] as Map? ?? {};
                    return CategoryCell(
                      pObj: pObj,
                      onPressed: () {},
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: groceriesArr.length,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 230,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    var pObj = listArr[index] as Map? ?? {};
                    return ProductCell(
                        pObj: pObj,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductDetails(),
                            ),
                          );
                        },
                        onCart: () {});
                  },
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: listArr.length,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
