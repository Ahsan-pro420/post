import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';

Widget Sub_Category_tile(context) {
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
