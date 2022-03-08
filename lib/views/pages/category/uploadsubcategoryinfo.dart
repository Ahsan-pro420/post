import 'dart:io';

import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:restaurant_app/Models/AddProduct/addImage.dart';
import 'package:restaurant_app/Models/AddProduct/addProductInfo.dart';
import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';
import 'package:restaurant_app/utills/customtextbutton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubCategoryInfo extends StatefulWidget {
  const SubCategoryInfo({Key? key}) : super(key: key);

  @override
  _SubCategoryInfoState createState() => _SubCategoryInfoState();
}

class _SubCategoryInfoState extends State<SubCategoryInfo> {
  File? _image;
  String? profileImage;
  String? apiToken;

  TextEditingController productName = TextEditingController();
  TextEditingController shortDisc = TextEditingController();
  TextEditingController orignalPrice = TextEditingController();
  TextEditingController longDisc = TextEditingController();
  getUserValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    apiToken = pref.getString("user_api_token");
    print(apiToken);
  }

  @override
  void initState() {
    getUserValue();
    super.initState();
  }

  @override
  void dispose() {
    _showPicker(context);
    didChangeDependencies();
    // dependOnInheritedWidgetOfExactType();
    super.dispose();
  }

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

  void _displaySuccessMotionToast(BuildContext context, message) {
    MotionToast.success(
      title: message,
      titleStyle: TextStyle(fontWeight: FontWeight.bold),
      description: "Updated!",
      descriptionStyle: TextStyle(fontSize: 12),
      layoutOrientation: ORIENTATION.RTL,
      animationType: ANIMATION.FROM_RIGHT,
      position: MOTION_TOAST_POSITION.CENTER,
      width: 300,
    ).show(context);
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

// Initial Selected Value
  int dropdownvalue = 1;

  // List of items in our dropdown menu
  var items = [
    1,
    2,
    3,
    4,
    5,
  ];

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
              Padding(
                padding:
                    const EdgeInsets.only(top: 40.0, left: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset("assets/images/Vector.png")),
                    Text("SubCategory Title",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 1)))),
                    GestureDetector(
                        onTap: () {
                          longDisc.clear();
                          shortDisc.clear();
                          productName.clear();
                          orignalPrice.clear();
                          dropdownvalue = 1;
                          setState(() {
                            _image = null;
                          });
                        },
                        child:
                            Image.asset("assets/images/foodimages/Delete1.png"))
                  ],
                ),
              ),
//upload pic

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
                                          "assets/images/vendor_logo.png",
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
                              height: MediaQuery.of(context).size.height * 0.04,
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
              Container(
                height: MediaQuery.of(context).size.height * 0.04,
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
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SingleChildScrollView(
                child: Container(
                    height: displayHeight(context) * 0.63,
                    width: displayWidth(context) * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: DropdownButton(
                            // Initial Value
                            value: dropdownvalue,

                            isExpanded: true,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: items.map((int items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text('$items'),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (int? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.003,
                        ),
                        Text(
                          "Product Name",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 0, 0, 0.4))),
                        ),
                        TextField(
                          controller: productName,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.003,
                        ),
                        Text(
                          "Short Discription",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 0, 0, 0.4))),
                        ),
                        TextField(
                          controller: shortDisc,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.003,
                        ),
                        Text(
                          "Original Price",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 0, 0, 0.4))),
                        ),
                        TextField(
                          controller: orignalPrice,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.003,
                        ),
                        Text(
                          "Description",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 0, 0, 0.4))),
                        ),
                        TextField(
                          controller: longDisc,
                          minLines: 1,
                          maxLines: 6,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.009,
                        ),
                        CustomTextButton(
                          buttonName: 'Update Profile',
                          buttonTextStyle: GoogleFonts.ubuntu(
                              textStyle: Constants.loginbuttonstyle()),
                          buttoncolor: Constants.black_light,
                          height: _height * 0.078,
                          width: displayWidth(context) * 0.9,
                          highlightColor: Constants.black_light,
                          onPressed: () {
                            final productImage = AddImage();
                            final productInfo = AddProductInfo();
                            // var res = '';

                            if (_image!.path.isNotEmpty) {
                              String imageFileName = basename(_image!.path);
                              productImage
                                  .uploadImage(_image!,
                                      "https://portal.letsride.today/api/v1/restaurant/image-uploading?api_token=$apiToken")
                                  .then((value) {
                                if (value == "Image_Uploaded") {
                                  print(_image);
                                  productInfo.setProductData({
                                    "api_token": apiToken,
                                    "category_id": dropdownvalue.toString(),
                                    "name": productName.text,
                                    "short_desc": shortDisc.text,
                                    "long_Desc": longDisc.text,
                                    "price": orignalPrice.text,
                                    "image": imageFileName,
                                  }).then((value) {
                                    // set user name in shared prefference
                                    // setUserName(value.name);
                                    // set image url in shared preffernce variable
                                    // setUserProfileImage(value.profileImg);
                                    // print(value.message);
                                    //  show message update successfully
                                    _displaySuccessMotionToast(
                                        context, value.message);
                                  });
                                }
                              });
                            }
                            // else {
                            //   userUpdate.apiCallUserUpdate({
                            //     "api_token": apiToken,
                            //     "name": userName.text,
                            //     "email": "email1@email.com",
                            //   }).then((value) {
                            //     setUserName(value.name);
                            //     _displaySuccessMotionToast(
                            //         context, value.message);
                            //   });
                            // }
                          },
                          textStyle: TextStyle(),
                        ),
                      ],
                    )),
              ),
              // SizedBox(
              //   height: 70,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
