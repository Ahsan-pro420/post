// import 'dart:html';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/Theme/Theme.dart';
// import 'package:matrix4_transform/matrix4_transform.dart';
// import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';
import 'package:restaurant_app/views/pages/HomeScreen/order_tile.dart';
import 'package:restaurant_app/views/pages/accountSetting/accountSetting.dart';
import 'package:restaurant_app/views/pages/category/categoryPage.dart';
import 'package:restaurant_app/views/pages/earning/earning.dart';
import 'package:restaurant_app/views/pages/orderHistory/orderHistory.dart';
import 'package:restaurant_app/views/widgets/tabButton.dart';
// import 'package:restaurant_app/views/widgets/progress_status_bar_widget.dart';
import 'package:restaurant_app/views/widgets/tab_bar_view.dart';
import 'package:restaurant_app/views/widgets/drawer_widget.dart';

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
        child: Drawer_widget(context),
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
//Orders Page
                  Container(
                    // color: Colors.amber,
                    margin: EdgeInsets.only(top: 5),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          order_tile(context),
                          order_tile(context),
                          order_tile(context)
                        ],
                      ),
                    ),
                  ),
//Schedule
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [order_tile(context), order_tile(context)],
                      ),
                    ),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          order_tile(context),
                          orderr(context, 3, 400, "fastfood", "Address")
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

//order tile bhi bna hoa same he
Widget orderr(context, int id, double price, var SubName, var Address) {
  return Container(
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
          padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order ID $id",
                style: Constants.orderidstyle(),
              ),
              Text(
                "$price",
                style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(237, 41, 57, 1))),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Divider(
            color: Colors.grey[100],
            thickness: 2,
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$SubName",
                style: Constants.ordersubcategory(),
              ),
              Text("1x", style: Constants.ordersubcategory()),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: displayWidth(context) * 0.78,
          child: Text(
            "$Address",
            style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(154, 154, 157, 1))),
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
              Image.asset("assets/images/timeCircle.png"),
              Text(
                "26-06-2021, 11:00 PM",
                style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(237, 41, 57, 1))),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
