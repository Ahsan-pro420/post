import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';
import 'package:restaurant_app/views/pages/orderHistory/orderDetails.dart';

Widget order_history_tile(
    context,
    Cat_name,
    prod_name,
    pricee,
    datee,
    idd,
    iimage,
    new_pricee,
    net_amountt,
    taxx,
    quantityy,
    cus_namee,
    cus_address,
    delivert_char) {
  return (GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetails(
                id: idd,
                name: prod_name,
                imagee: iimage,
                price: pricee,
                date: datee,
                new_priceee: new_pricee,
                net_amounttt: net_amountt,
                delivert_charr: delivert_char,
                taxxx: taxx,
                quantityyy: quantityy,
                cus_addresss: cus_address,
                cus_nameee: cus_namee),
          ));
    },
    child: Container(
      margin: EdgeInsets.only(top: 25),
      height: displayHeight(context) * 0.14,
      width: displayWidth(context) / 1.17,
      decoration: Constants.containerstyle(),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 8.0),
                child: Image.asset("assets/images/foodimages/kfc.png"),
              ),
            ],
          ),
          SizedBox(
            width: displayWidth(context) * 0.035,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Cat_name,
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  prod_name,
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color.fromRGBO(154, 154, 157, 1),
                  )),
                ),
                SizedBox(
                  height: 9,
                ),
                Text(
                  "$datee, 22:32",
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color.fromRGBO(154, 154, 157, 1),
                  )),
                ),
              ],
            ),
          ),
          SizedBox(
            width: displayWidth(context) * 0.08,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 40),
                child: Text(
                  "\$ $pricee",
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(237, 41, 57, 1),
                  )),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  ));
}
