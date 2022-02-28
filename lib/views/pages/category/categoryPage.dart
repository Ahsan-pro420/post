import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';
import 'package:restaurant_app/views/pages/category/uploadcategoryinfo.dart';
import 'package:restaurant_app/views/pages/category/uploadsubcategoryinfo.dart';
import 'package:restaurant_app/views/widgets/tab_bar_view.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: displayHeight(context) - kBottomNavigationBarHeight,
          width: displayWidth(context),
          margin: EdgeInsets.only(top: 40.0, right: 15, left: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/Menu.png"),
                  Text(
                    'Category',
                    style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CategoryInfo()),
                      );
                    },
                    child: Container(
                      height: 30.0,
                      width: 30.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(237, 41, 57, 0.1),
                      ),
                      child: Text(
                        "+",
                        style: TextStyle(color: Colors.red, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              //search bar
              Container(
                margin: EdgeInsets.only(top: 25, left: 20),
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
              // category list
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
                height: displayHeight(context) * 0.05,
                child: new ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 10),
                        child: Text(
                          "Category1",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                            color: Colors.white,
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 10),
                        child: Text(
                          "Category2",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                            color: Colors.black,
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 10),
                        child: Text(
                          "Category3",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                            color: Colors.black,
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 10),
                        child: Text(
                          "Category4",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                            color: Colors.black,
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sub-Category',
                    style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SubCategoryInfo()),
                      );
                    },
                    child: Container(
                      height: 30.0,
                      width: 30.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(237, 41, 57, 0.1),
                      ),
                      child: Text(
                        "+",
                        style: TextStyle(color: Colors.red, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              // list of products
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: displayHeight(context) * 0.3,
                        width: displayWidth(context) / 2.3,
                        child: Stack(
                          children: [
                            Container(
                              decoration: Constants.containerstyle(),
                              height: displayHeight(context) * 0.225,
                              width: displayWidth(context) / 2.2,
                              margin: EdgeInsets.only(
                                top: 50,
                              ),
                            ),
                            Positioned(
                                top: 5,
                                left: displayWidth(context) * 0.05,
                                child: Image.asset(
                                    "assets/images/category_image.png")),
                            Positioned(
                                top: displayHeight(context) * 0.19,
                                left: displayWidth(context) * 0.1,
                                child: Text(
                                  "Brand Name",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                  )),
                                )),
                            Positioned(
                                top: displayHeight(context) * 0.225,
                                left: displayWidth(context) * 0.13,
                                child: Text(
                                  "Subcategory 1",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(237, 41, 57, 1),
                                  )),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        height: displayHeight(context) * 0.3,
                        width: displayWidth(context) / 2.3,
                        child: Stack(
                          children: [
                            Container(
                              decoration: Constants.containerstyle(),
                              height: displayHeight(context) * 0.225,
                              width: displayWidth(context) / 2.2,
                              margin: EdgeInsets.only(
                                top: 50,
                              ),
                            ),
                            Positioned(
                                top: 5,
                                left: displayWidth(context) * 0.05,
                                child: Image.asset(
                                    "assets/images/category_image.png")),
                            Positioned(
                                top: displayHeight(context) * 0.19,
                                left: displayWidth(context) * 0.1,
                                child: Text(
                                  "Brand Name",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                  )),
                                )),
                            Positioned(
                                top: displayHeight(context) * 0.225,
                                left: displayWidth(context) * 0.13,
                                child: Text(
                                  "Subcategory 2",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(237, 41, 57, 1),
                                  )),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: displayHeight(context) * 0.3,
                        width: displayWidth(context) / 2.3,
                        child: Stack(
                          children: [
                            Container(
                              decoration: Constants.containerstyle(),
                              height: displayHeight(context) * 0.225,
                              width: displayWidth(context) / 2.2,
                              margin: EdgeInsets.only(
                                top: 50,
                              ),
                            ),
                            Positioned(
                                top: 5,
                                left: displayWidth(context) * 0.05,
                                child: Image.asset(
                                    "assets/images/category_image.png")),
                            Positioned(
                                top: displayHeight(context) * 0.19,
                                left: displayWidth(context) * 0.1,
                                child: Text(
                                  "Brand Name",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                  )),
                                )),
                            Positioned(
                                top: displayHeight(context) * 0.225,
                                left: displayWidth(context) * 0.13,
                                child: Text(
                                  "Subcategory 1",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(237, 41, 57, 1),
                                  )),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        height: displayHeight(context) * 0.3,
                        width: displayWidth(context) / 2.3,
                        child: Stack(
                          children: [
                            Container(
                              decoration: Constants.containerstyle(),
                              height: displayHeight(context) * 0.225,
                              width: displayWidth(context) / 2.2,
                              margin: EdgeInsets.only(
                                top: 50,
                              ),
                            ),
                            Positioned(
                                top: 5,
                                left: displayWidth(context) * 0.05,
                                child: Image.asset(
                                    "assets/images/category_image.png")),
                            Positioned(
                                top: displayHeight(context) * 0.19,
                                left: displayWidth(context) * 0.1,
                                child: Text(
                                  "Brand Name",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                  )),
                                )),
                            Positioned(
                                top: displayHeight(context) * 0.225,
                                left: displayWidth(context) * 0.13,
                                child: Text(
                                  "Subcategory 2",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(237, 41, 57, 1),
                                  )),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: TabBarViewData(),
    );
  }
}
