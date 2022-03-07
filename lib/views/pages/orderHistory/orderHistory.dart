import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/Model/order_history_api/order_history_api.dart';
import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';
import 'package:restaurant_app/views/pages/orderHistory/orderDetails.dart';
import 'package:restaurant_app/views/pages/orderHistory/order_history_tile.dart';
import 'package:restaurant_app/views/widgets/tabButton.dart';
import 'package:restaurant_app/views/widgets/tab_bar_view.dart';
import 'package:http/http.dart' as http;

class OrdersHistory extends StatefulWidget {
  @override
  _OrdersHistoryState createState() => _OrdersHistoryState();
}

class _OrdersHistoryState extends State<OrdersHistory> {
  List<OrderHistoryApi> order_history_list = [];

  List<OrderHistoryApi> order_history_active_list = [];

//Seperate List for Active Status Order
  List<OrderHistoryApi> get_order_history_active() {
    if (order_history_list.isEmpty) {
      return order_history_active_list;
    } else {
      Iterable gettt = order_history_list
          .where((element) => element.orderStatus!.contains("Completed"));
      gettt.forEach((element) {
        order_history_active_list.add(element);
      });

      return order_history_active_list;
    }
  }

  Future<List<OrderHistoryApi>> get_order_history_api() async {
    final response = await http.get(Uri.parse(
        "https://persecuted-admissio.000webhostapp.com/restaurant/restaurant_api/orders.php"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      order_history_list.clear();
      order_history_active_list.clear();
      for (Map i in data) {
        order_history_list.add(OrderHistoryApi.fromJson(i));
      }
      get_order_history_active();
      print(order_history_list.length);
      print(order_history_active_list.length);
      return order_history_list;
    } else {
      return order_history_list;
    }
  }

  int _selectedPage = 0;
  PageController? _pageController;

  void _changePage(int pageNum) {
    setState(() {
      _selectedPage = pageNum;
      _pageController?.animateToPage(
        pageNum,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: displayHeight(context) - kBottomNavigationBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset("assets/images/Vector.png")),
                    SizedBox(
                      width: displayWidth(context) * 0.25,
                    ),
                    Text(
                      "Order History",
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //All&Complete&Failed

              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 12.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TabButton(
                      text: "All",
                      pageNumber: 0,
                      selectedPage: _selectedPage,
                      onPressed: () {
                        _changePage(0);
                      },
                    ),
                    TabButton(
                      text: "Completed",
                      pageNumber: 1,
                      selectedPage: _selectedPage,
                      onPressed: () {
                        print(order_history_active_list.length);
                        print("object");
                        _changePage(1);
                      },
                    ),
                    TabButton(
                      text: "Failed",
                      pageNumber: 2,
                      selectedPage: _selectedPage,
                      onPressed: () {
                        _changePage(2);
                      },
                    ),
                  ],
                ),
              ),
              //search bar
              Container(
                margin: EdgeInsets.only(top: 25),
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
              Container(
                height: 1000,
                child: PageView(
                  onPageChanged: (int page) {
                    setState(() {
                      _selectedPage = page;
                    });
                  },
                  controller: _pageController,
                  children: [
                    //All Order History

                    //All

                    FutureBuilder(
                        future: get_order_history_api(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Container(
                                child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            ));
                          } else {
                            return Container(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: order_history_list.length,
                                  itemBuilder: (context, index) {
                                    return order_history_tile(
                                        context,
                                        "zinger",
                                        order_history_list[index]
                                            .productName
                                            .toString(),
                                        order_history_list[index]
                                            .totalAmount
                                            .toString(),
                                        order_history_list[index]
                                            .date
                                            .toString(),
                                        order_history_list[index].orderId,
                                        order_history_list[index].productImage1,
                                        order_history_list[index].newPrice,
                                        order_history_list[index].netAmount,
                                        order_history_list[index].tax,
                                        order_history_list[index].orderQuantity,
                                        order_history_list[index].customerName,
                                        order_history_list[index]
                                            .customerAddress,
                                        order_history_list[index]
                                            .deliveryCharges);
                                  }),
                            );
                          }
                        })

                    // Container(
                    //   child: Column(children: [
                    //     order_history_tile(context, "fa", "fa"),
                    //     order_history_tile(context, "fa", "fa"),
                    //     order_history_tile(context, "fa", "fa"),
                    //     order_history_tile(context, "fa", "fa"),
                    //     order_history_tile(context, "fa", "fa"),
                    //     order_history_tile(context, "fa", "fa"),
                    //   ]),
                    // ),

                    //Completed

                    ,
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: order_history_active_list.length,
                                itemBuilder: (context, index) {
                                  return order_history_tile(
                                      context,
                                      "zinger",
                                      order_history_active_list[index]
                                          .productName
                                          .toString(),
                                      order_history_active_list[index]
                                          .totalAmount
                                          .toString(),
                                      order_history_active_list[index]
                                          .date
                                          .toString(),
                                      order_history_active_list[index].orderId,
                                      order_history_active_list[index]
                                          .productImage1,
                                      order_history_active_list[index].newPrice,
                                      order_history_active_list[index]
                                          .netAmount,
                                      order_history_active_list[index].tax,
                                      order_history_active_list[index]
                                          .orderQuantity,
                                      order_history_active_list[index]
                                          .customerName,
                                      order_history_active_list[index]
                                          .customerAddress,
                                      order_history_active_list[index]
                                          .deliveryCharges);
                                }),
                          )
                          // order_history_tile(context),
                          // order_history_tile(context),
                        ],
                      ),
                    ),

                    //Failed

                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // order_history_tile(
                            //     context, "mae", "fad", "af", "fa", "af", "afsd")
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
      ),
      bottomNavigationBar: TabBarViewData(),
    );
  }
}
