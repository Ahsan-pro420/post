import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryInfo extends StatefulWidget {
  const CategoryInfo({Key? key}) : super(key: key);

  @override
  _CategoryInfoState createState() => _CategoryInfoState();
}

class _CategoryInfoState extends State<CategoryInfo> {
  // getUserValue() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   apiToken = pref.getString("user_api_token");
  //   print(apiToken);
  // }

  // @override
  // void initState() {
  //   getUserValue();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _showPicker(context);
  //   didChangeDependencies();
  //   // dependOnInheritedWidgetOfExactType();
  //   super.dispose();
  // }

  File? _image;
  String? profileImage;

  _imageFromCamera() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    // .pickImage(source: ImageSource.camera, imageQuality: 50);

    if (image != null) {
      setState(() {
        _image = File(image.path);
        // Navigator.pop(context);
        print(_image);
      });
    }
  }

  _imageFromGallery() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    // .pickImage(source: ImageSource.camera, imageQuality: 50);

    if (image != null) {
      setState(() {
        _image = File(image.path);
        print(_image!.path);
      });
    }
  }

  void _showPicker(context1) {
    showModalBottomSheet(
        context: context1,
        builder: (BuildContext context) {
          didChangeDependencies();
          return SafeArea(
              child: Wrap(
            children: [
              // GestureDetector(
              //     onTap: () {
              //       Navigator.pop(context);
              //     },
              //     child: Text("Close")),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Gallery"),
                onTap: () {
                  _imageFromGallery();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Camera"),
                onTap: () {
                  _imageFromCamera();
                  Navigator.pop(context);
                },
              ),
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
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
                    Container(
                        child: _image != null
                            ? Container(
                                decoration: BoxDecoration(),
                                child: Center(
                                  child: Image.file(
                                    _image!,
                                    // height: displayHeight(context) / 3,
                                    // width: displayWidth(context),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              )
                            : Image.asset(
                                "assets/images/foodimages/cover2.jpg",
                                fit: BoxFit.fill,
                              )),
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
                              child: Image.asset(
                                "assets/images/Vector.png",
                                color: Colors.white,
                              )), //back icon
                          Text("Category Title",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white))),
                          Image.asset(
                            "assets/images/foodimages/Delete1.png",
                            color: Colors.white,
                          )
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

//profile pic

              Container(
                width: _width / 3,
                height: _height / 5.9,
                // color: Colors.amber,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: GestureDetector(
                        onTap: () => _showPicker(context),
                        child: Center(
                          child: _image != null
                              ? CircleAvatar(
                                  radius: 60.0,
                                  child: ClipRRect(
                                    child: Image.file(
                                      _image!,
                                      height: 130,
                                      width: 130,
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(150.0),
                                  ),
                                )
                              : profileImage != null
                                  ? CircleAvatar(
                                      radius: 60.0,
                                      child: ClipRRect(
                                        child: Image.network(
                                          profileImage!,
                                          width: 130,
                                          height: 130,
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(150.0),
                                      ),
                                    )
                                  : CircleAvatar(
                                      radius: 60.0,
                                      child: ClipRRect(
                                        child: Image.asset(
                                          "assets/images/foodimages/p1.jpg",
                                          width: 130,
                                          height: 130,
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(150.0),
                                      ),
                                    ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 8,
                        // top: displayHeight(context) * 0.243,
                        // right: displayWidth(context) * 0.24,
                        child: GestureDetector(
                          onTap: () {
                            // _displaySuccessMotionToast(context);
                            _showPicker(context);
                          },
                          child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  border: Border.all(
                                    color: Colors.red[500]!,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Image.asset("assets/images/Camera.png")),
                        )),
                  ],
                ),
              ),

              // Container(
              //   height: displayHeight(context) / 6,
              //   width: displayWidth(context) / 3.2,
              //   margin: EdgeInsets.all(10),
              //   decoration: BoxDecoration(
              //     color: Color.fromRGBO(237, 41, 57, 1),
              //     shape: BoxShape.circle,
              //   ),
              // ),
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
