// import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/Theme/Theme.dart';
// import 'package:matrix4_transform/matrix4_transform.dart';
// import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';
import 'package:restaurant_app/views/pages/accountSetting/accountSetting.dart';
import 'package:restaurant_app/views/pages/category/categoryPage.dart';
import 'package:restaurant_app/views/pages/earning/earning.dart';
import 'package:restaurant_app/views/pages/orderHistory/orderHistory.dart';
import 'package:restaurant_app/views/widgets/tabButton.dart';
// import 'package:restaurant_app/views/widgets/progress_status_bar_widget.dart';
import 'package:restaurant_app/views/widgets/tab_bar_view.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectPage = 0;
  PageController? _pageControle;

  void _changePage(int pageNumber) {
    setState(() {
      _selectPage = pageNumber;
      _pageControle?.animateToPage(
        pageNumber,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void initState() {
    _pageControle = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageControle?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.all(10.0),
            // children: _listViewData
            //     .map((data) => ListTile(
            //           title: Text(data),
            //         ))
            //     .toList(),
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AccountSetting()),
                            );
                          },
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Image(image: AssetImage("assets/images/Wallet.png")),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Account Setting",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ))),
                              // SizedBox(
                              //   width: 20,
                              // ),
                              // Text("\$87.00",
                              //     style: GoogleFonts.ubuntu(
                              //         textStyle: TextStyle(
                              //       fontWeight: FontWeight.w500,
                              //       fontSize: 17,
                              //       color: Colors.red,
                              //     ))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5, right: 5),
                          child: Divider(
                            color: Colors.grey[100],
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        // 2nd
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrdersHistory()),
                            );
                          },
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Image(image: AssetImage("assets/images/Bag.png")),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Order History",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Divider(
                            color: Colors.grey[100],
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),

                        // 3rd
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryPage()),
                            );
                          },
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Image(image: AssetImage("assets/images/Bag.png")),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Category",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Divider(
                            color: Colors.grey[100],
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        // 4th
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Earning()),
                            );
                          },
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Image(image: AssetImage("assets/images/Bag.png")),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Earnings",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Divider(
                            color: Colors.grey[100],
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                      ],
                    ),
                  ))
            ]),
      ),
      body: Container(
        height: displayHeight(context) - kBottomNavigationBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Image.asset("assets/images/Menu.png"),
                      // icon: Icon(Icons.menu, color: Color(0xFF1f186f),),
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      }),
                  SizedBox(
                    width: displayWidth(context) * 0.25,
                  ),
                  Text(
                    "Orders",
                    style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    )),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabButton(
                    text: "Orders",
                    pageNumber: 0,
                    selectedPage: _selectPage,
                    onPressed: () {
                      _changePage(0);
                    },
                  ),
                  TabButton(
                    text: "Scheduled",
                    pageNumber: 1,
                    selectedPage: _selectPage,
                    onPressed: () {
                      _changePage(1);
                    },
                  ),
                  TabButton(
                    text: "History",
                    pageNumber: 2,
                    selectedPage: _selectPage,
                    onPressed: () {
                      _changePage(2);
                    },
                  ),
                ],
              ),
            ),
            //search bar
            Container(
              margin: EdgeInsets.only(top: 25, left: 25),
              height: displayHeight(context) * 0.066,
              width: displayWidth(context) / 1.17,
              decoration: Constants.containerstyle(),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Image.asset("assets/images/Search.png"),
                  suffixIcon: Image.asset("assets/images/Filter.png"),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                onPageChanged: (int page) {
                  setState(() {
                    _selectPage = page;
                  });
                },
                controller: _pageControle,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: displayHeight(context) / 4.3,
                            width: displayWidth(context),
                            margin: EdgeInsets.only(
                                left: displayWidth(context) * 0.07,
                                right: displayWidth(context) * 0.07,
                                top: 20),
                            decoration: Constants.containerstyle(),
                            // color: Color.fromRGBO(255, 255, 255, 1),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Order ID",
                                        style: Constants.orderidstyle(),
                                      ),
                                      Text(
                                        "\$86.00",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    237, 41, 57, 1))),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 15.0, right: 15.0),
                                  child: Divider(
                                    color: Colors.grey[100],
                                    thickness: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 15, right: 15, bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sub-Category Name",
                                        style: Constants.ordersubcategory(),
                                      ),
                                      Text("1x",
                                          style: Constants.ordersubcategory()),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width: displayWidth(context) * 0.78,
                                  child: Text(
                                    "10 Paya Lebar Rd, #B1-14 PLQ Mall, Singapore 409057",
                                    style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                154, 154, 157, 1))),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    left: 15,
                                    right: 15,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          "assets/images/timeCircle.png"),
                                      Text(
                                        "26-06-2021, 11:00 PM",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    237, 41, 57, 1))),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: displayHeight(context) / 4.3,
                            width: displayWidth(context),
                            margin: EdgeInsets.only(
                                left: displayWidth(context) * 0.07,
                                right: displayWidth(context) * 0.07,
                                top: 20),
                            decoration: Constants.containerstyle(),
                            // color: Color.fromRGBO(255, 255, 255, 1),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Order ID",
                                        style: Constants.orderidstyle(),
                                      ),
                                      Text(
                                        "\$86.00",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    237, 41, 57, 1))),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 15.0, right: 15.0),
                                  child: Divider(
                                    color: Colors.grey[100],
                                    thickness: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 15, right: 15, bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sub-Category Name",
                                        style: Constants.ordersubcategory(),
                                      ),
                                      Text("1x",
                                          style: Constants.ordersubcategory()),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width: displayWidth(context) * 0.78,
                                  child: Text(
                                    "10 Paya Lebar Rd, #B1-14 PLQ Mall, Singapore 409057",
                                    style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                154, 154, 157, 1))),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    left: 15,
                                    right: 15,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          "assets/images/timeCircle.png"),
                                      Text(
                                        "26-06-2021, 11:00 PM",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    237, 41, 57, 1))),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: displayHeight(context) / 4.3,
                            width: displayWidth(context),
                            margin: EdgeInsets.only(
                                left: displayWidth(context) * 0.07,
                                right: displayWidth(context) * 0.07,
                                top: 20),
                            decoration: Constants.containerstyle(),
                            // color: Color.fromRGBO(255, 255, 255, 1),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Order ID",
                                        style: Constants.orderidstyle(),
                                      ),
                                      Text(
                                        "\$86.00",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    237, 41, 57, 1))),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 15.0, right: 15.0),
                                  child: Divider(
                                    color: Colors.grey[100],
                                    thickness: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 15, right: 15, bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sub-Category Name",
                                        style: Constants.ordersubcategory(),
                                      ),
                                      Text("1x",
                                          style: Constants.ordersubcategory()),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width: displayWidth(context) * 0.78,
                                  child: Text(
                                    "10 Paya Lebar Rd, #B1-14 PLQ Mall, Singapore 409057",
                                    style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                154, 154, 157, 1))),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    left: 15,
                                    right: 15,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          "assets/images/timeCircle.png"),
                                      Text(
                                        "26-06-2021, 11:00 PM",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    237, 41, 57, 1))),
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
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: displayHeight(context) / 4.3,
                            width: displayWidth(context),
                            margin: EdgeInsets.only(
                                left: displayWidth(context) * 0.07,
                                right: displayWidth(context) * 0.07,
                                top: 20),
                            decoration: Constants.containerstyle(),
                            // color: Color.fromRGBO(255, 255, 255, 1),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Order ID",
                                        style: Constants.orderidstyle(),
                                      ),
                                      Text(
                                        "\$86.00",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    237, 41, 57, 1))),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 15.0, right: 15.0),
                                  child: Divider(
                                    color: Colors.grey[100],
                                    thickness: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 15, right: 15, bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sub-Category Name",
                                        style: Constants.ordersubcategory(),
                                      ),
                                      Text("1x",
                                          style: Constants.ordersubcategory()),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width: displayWidth(context) * 0.78,
                                  child: Text(
                                    "10 Paya Lebar Rd, #B1-14 PLQ Mall, Singapore 409057",
                                    style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                154, 154, 157, 1))),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    left: 15,
                                    right: 15,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          "assets/images/timeCircle.png"),
                                      Text(
                                        "26-06-2021, 11:00 PM",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    237, 41, 57, 1))),
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
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: displayHeight(context) / 4.3,
                            width: displayWidth(context),
                            margin: EdgeInsets.only(
                                left: displayWidth(context) * 0.07,
                                right: displayWidth(context) * 0.07,
                                top: 20),
                            decoration: Constants.containerstyle(),
                            // color: Color.fromRGBO(255, 255, 255, 1),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Order ID",
                                        style: Constants.orderidstyle(),
                                      ),
                                      Text(
                                        "\$86.00",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    237, 41, 57, 1))),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 15.0, right: 15.0),
                                  child: Divider(
                                    color: Colors.grey[100],
                                    thickness: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 15, right: 15, bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sub-Category Name",
                                        style: Constants.ordersubcategory(),
                                      ),
                                      Text("1x",
                                          style: Constants.ordersubcategory()),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width: displayWidth(context) * 0.78,
                                  child: Text(
                                    "10 Paya Lebar Rd, #B1-14 PLQ Mall, Singapore 409057",
                                    style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                154, 154, 157, 1))),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    left: 15,
                                    right: 15,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          "assets/images/timeCircle.png"),
                                      Text(
                                        "26-06-2021, 11:00 PM",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    237, 41, 57, 1))),
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
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: TabBarViewData(),
    );
  }
}
