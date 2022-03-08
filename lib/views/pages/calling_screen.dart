import 'package:flutter/material.dart';
import 'package:restaurant_app/views/pages/HomeScreen/orders.dart';
import 'package:restaurant_app/views/pages/accountSetting/accountSetting.dart';
import 'package:restaurant_app/views/pages/category/categoryPage.dart';
import 'package:restaurant_app/views/pages/earning/earning.dart';

class CallingScreen extends StatefulWidget {
  const CallingScreen({Key? key}) : super(key: key);

  @override
  State<CallingScreen> createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {
  int currentIndex = 1;
  final screens = [
    Earning(),
    OrderPage(),
    CategoryPage(),
    AccountSetting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      //bottom bar

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.deepOrangeAccent,
        //unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/Wallet.png"),
              //color: Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/foodimages/timeicon.png"),
            ),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: ""
              // icon: ImageIcon(
              //   AssetImage("assets/images/Category.png"),
              //   //color: Colors.black,
              // ),
              // label: '',
              ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/Setting.png"),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
