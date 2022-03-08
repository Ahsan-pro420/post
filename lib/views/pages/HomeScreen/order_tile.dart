import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';

Widget order_tile(context) {
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
                "Order ID",
                style: Constants.orderidstyle(),
              ),
              Text(
                "\$90.00",
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
                "Sub-Category Name",
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
            "10 Paya Lebar Rd, #B1-14 PLQ Mall, Singapore 409057",
            style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(154, 154, 157, 1))),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 5,
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
