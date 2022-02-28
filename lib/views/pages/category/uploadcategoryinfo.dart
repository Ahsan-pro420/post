import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';

class CategoryInfo extends StatefulWidget {
  const CategoryInfo({Key? key}) : super(key: key);

  @override
  _CategoryInfoState createState() => _CategoryInfoState();
}

class _CategoryInfoState extends State<CategoryInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: displayHeight(context),
          width: displayWidth(context),
          child: Column(
            children: [
              Container(
                height: displayHeight(context) / 3,
                width: displayWidth(context),
                color: Color.fromRGBO(196, 196, 196, 0.4),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 40.0, left: 15.0, right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image.asset("assets/images/Vector.png")),
                          Text("Category Title",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(0, 0, 0, 1)))),
                          Image.asset("assets/images/foodimages/Delete1.png")
                        ],
                      ),
                    ),
                    Positioned(
                        top: displayHeight(context) * 0.2,
                        left: displayWidth(context) / 3.2,
                        child: Text(
                          "Upload Cover Picture",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                          )),
                        )),

                    // Container(
                    //     // height: displayHeight(context) * 0.2,
                    //     // width: displayWidth(context),
                    //     // color: Color.fromRGBO(0, 0, 0, 1),
                    //     )
                  ],
                ),
              ),
              Container(
                height: displayHeight(context) / 6,
                width: displayWidth(context) / 3.2,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(237, 41, 57, 1),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                height: 20,
                alignment: Alignment.center,
                child: Text(
                  "Upload Product Picture",
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                  )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  height: displayHeight(context) * 0.1,
                  width: displayWidth(context) * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Category Name",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(0, 0, 0, 0.4))),
                      ),
                      TextField(),
                    ],
                  )),
              SizedBox(
                height: 70,
              ),
              Container(
                alignment: Alignment.center,
                height: displayHeight(context) * 0.08,
                width: displayWidth(context) * 0.8,
                decoration: Constants.buttonstyle(),
                child: Text(
                  "Edit",
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(246, 246, 249, 1))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
