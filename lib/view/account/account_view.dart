import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cp_groceries/common/color_extensions.dart';
import 'package:cp_groceries/common_widget/account_row.dart';
import 'package:cp_groceries/view/login/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  String userName = "";
  String userEmail = "";

  @override
  void initState() {
    super.initState();
    fetchUserName();
  }

  void fetchUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      setState(() {
        userName = userSnapshot['name'];
        userEmail = user.email ?? "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image.asset(
                        "assets/img/u1.png",
                        width: 60,
                        height: 60,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                userName,
                                style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.edit,
                                color: TColor.primary,
                                size: 18,
                              ),
                            ],
                          ),
                          Text(
                            userEmail,
                            style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.black26,
              ),
              AccountRow(
                title: "Orders",
                icon: "assets/img/a_order.png",
                onPressed: () {},
              ),
              AccountRow(
                title: "My Details",
                icon: "assets/img/a_my_detail.png",
                onPressed: () {},
              ),
              AccountRow(
                title: "Delivery Address",
                icon: "assets/img/a_delivery_address.png",
                onPressed: () {},
              ),
              AccountRow(
                title: "Payment Methods",
                icon: "assets/img/paymenth_methods.png",
                onPressed: () {},
              ),
              AccountRow(
                title: "Promo Code",
                icon: "assets/img/a_promocode.png",
                onPressed: () {},
              ),
              AccountRow(
                title: "Notifications",
                icon: "assets/img/a_noitification.png",
                onPressed: () {},
              ),
              AccountRow(
                title: "Help",
                icon: "assets/img/a_help.png",
                onPressed: () {},
              ),
              AccountRow(
                title: "About Us",
                icon: "assets/img/a_about.png",
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: confirmLogout,
                      height: 60,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19)),
                      minWidth: double.maxFinite,
                      elevation: 0.1,
                      color: const Color(0xffF2F3F2),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Log Out",
                                style: TextStyle(
                                    color: TColor.primary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Image.asset(
                              "assets/img/logout.png",
                              width: 20,
                              height: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> confirmLogout() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black, // Default color for text
                ),
                children: <TextSpan>[
                  const TextSpan(
                    text: 'Logout from ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'CP Groceries',
                    style: TextStyle(
                      color: TColor.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () async {
                // Perform logout logic here
                await FirebaseAuth.instance.signOut();

                if (mounted) {
                  Navigator.of(context).pop();
                }

                if (mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogInView(),
                    ),
                  );
                }
              },
              child: Text(
                'Logout',
                style: TextStyle(
                  color: TColor.primary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
