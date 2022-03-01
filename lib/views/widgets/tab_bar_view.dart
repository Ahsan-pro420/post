import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/views/pages/accountSetting/accountSetting.dart';
import 'package:restaurant_app/views/pages/category/categoryPage.dart';
import 'package:restaurant_app/views/pages/earning/earning.dart';
import 'package:restaurant_app/views/pages/orderHistory/orderHistory.dart';

class TabBarViewData extends StatefulWidget {
  const TabBarViewData({Key? key}) : super(key: key);

  @override
  _TabBarViewDataState createState() => _TabBarViewDataState();
}

class _TabBarViewDataState extends State<TabBarViewData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedIconTheme: IconThemeData(
            color: Colors.black,
          ),
          unselectedItemColor: Colors.deepOrangeAccent,
          items: [
            BottomNavigationBarItem(
              label: "",
              icon: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Earning(),
                      ));
                },
                icon: ImageIcon(
                  AssetImage("assets/images/Wallet.png"),
                  color: Colors.red,
                ),
              ),
            ),
            BottomNavigationBarItem(
                label: "",
                icon: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrdersHistory(),
                        ));
                  },
                  icon: ImageIcon(
                    AssetImage("assets/images/timeCircle.png"),
                    color: Colors.red,
                  ),
                )),
            BottomNavigationBarItem(
                label: "",
                icon: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryPage(),
                        ));
                  },
                  icon: ImageIcon(
                    AssetImage("assets/images/Category.png"),
                    color: Colors.red,
                  ),
                )),
            BottomNavigationBarItem(
                label: "",
                icon: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountSetting(),
                        ));
                  },
                  icon: ImageIcon(
                    AssetImage("assets/images/Setting.png"),
                    color: Colors.red,
                  ),
                )),
          ],

          // items: const <BottomNavigationBarItem>[
          //   // BottomNavigationBarItem(
          //   //   icon: ImageIcon(
          //   //     AssetImage("assets/images/Home.png"),
          //   //     color: Colors.red,
          //   //   ),
          //   //   label: '',
          //   // ),
          //   BottomNavigationBarItem(
          //     icon: ImageIcon(
          //       AssetImage("assets/images/Wallet.png"),
          //       color: Colors.black,
          //     ),
          //     label: '',
          //   ),

          //   BottomNavigationBarItem(
          //     icon: ImageIcon(
          //       AssetImage("assets/images/foodimages/timeicon.png"),
          //     ),
          //     label: '',
          //   ),
          //   BottomNavigationBarItem(
          //     icon: ImageIcon(
          //       AssetImage("assets/images/Category.png"),
          //       color: Colors.black,
          //     ),
          //     label: '',
          //   ),
          //   BottomNavigationBarItem(
          //     icon: ImageIcon(
          //       AssetImage("assets/images/Setting.png"),
          //     ),
          //     label: '',
          //   ),
          // ],
        ),
      ),
    );
  }
}
