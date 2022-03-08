import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';

Widget Sub_Category_tile2(context) {
  return Container(
    //color: Colors.brown,
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
            child: Image.asset("assets/images/category_image.png")),
        Positioned(
            top: displayHeight(context) * 0.19,
            left: displayWidth(context) * 0.1,
            child: Text(
              "Brand Name 4",
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
  );
}

// Trending popluar list view builder
Widget sub_category_tile1(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
          alignment: Alignment.center,
          margin:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.04),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            color: Colors.black,
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black))),
              backgroundColor: MaterialStateProperty.all(Colors.black),
            ),
            onPressed: () {},
            child: Text(
              "Category 1",
              style: GoogleFonts.ubuntu(
                  textStyle: TextStyle(
                color: Colors.white,
              )),
            ),
          )),
    ],
  );
}


/*margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
    height: displayHeight(Context) * 0.05,
    child: Container(
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
    ),*/