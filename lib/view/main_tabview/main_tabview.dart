import 'package:cp_groceries/view/account/account_view.dart';
import 'package:cp_groceries/view/explore/explore_view.dart';
import 'package:cp_groceries/view/favourite/favourite_view.dart';
import 'package:cp_groceries/view/home/home_view.dart';
import 'package:cp_groceries/view/my_cart/my_cart_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extensions.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
    controller?.addListener(() {
      selectTab = controller?.index ?? 0;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: const [
          HomeView(),
          ExploreView(),
          MyCartView(),
          FavouritesView(),
          AccountView(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 3,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: TabBar(
            controller: controller,
            indicatorColor: Colors.transparent,
            indicatorWeight: 1,
            labelColor: TColor.primary,
            labelStyle: TextStyle(
              color: TColor.primary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelColor: TColor.primaryText,
            unselectedLabelStyle: TextStyle(
              color: TColor.primaryText,
              fontSize: 9,
              fontWeight: FontWeight.w600,
            ),
            tabs: [
              Tab(
                text: "Shop",
                icon: Tooltip(
                  message: "Shop",
                  child: Image.asset(
                    "assets/img/store_tab.png",
                    width: 25,
                    height: 25,
                    color: selectTab == 0 ? TColor.primary : TColor.primaryText,
                  ),
                ),
              ),
              Tab(
                text: "Explore",
                icon: Tooltip(
                  message: "Explore",
                  child: Image.asset(
                    "assets/img/explore_tab.png",
                    width: 25,
                    height: 25,
                    color: selectTab == 1 ? TColor.primary : TColor.primaryText,
                  ),
                ),
              ),
              Tab(
                text: "Cart",
                icon: Tooltip(
                  message: "View Cart",
                  child: Image.asset(
                    "assets/img/cart_tab.png",
                    width: 25,
                    height: 25,
                    color: selectTab == 2 ? TColor.primary : TColor.primaryText,
                  ),
                ),
              ),
              Tab(
                text: "Favourite",
                icon: Tooltip(
                  message: "Favourites",
                  child: Image.asset(
                    "assets/img/fav_tab.png",
                    width: 25,
                    height: 25,
                    color: selectTab == 3 ? TColor.primary : TColor.primaryText,
                  ),
                ),
              ),
              Tab(
                text: "Account",
                icon: Tooltip(
                  message: "Account",
                  child: Image.asset(
                    "assets/img/account_tab.png",
                    width: 25,
                    height: 25,
                    color: selectTab == 4 ? TColor.primary : TColor.primaryText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
