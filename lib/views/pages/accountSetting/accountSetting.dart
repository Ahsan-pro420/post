import 'dart:io';
import 'package:motion_toast/motion_toast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:restaurant_app/Models/AuthApi/UpdateUserProfile/UserProfileUpdate.dart';
import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';
import 'package:restaurant_app/utills/customtextbutton.dart';
import 'package:restaurant_app/views/widgets/tab_bar_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({Key? key}) : super(key: key);

  @override
  _AccountSettingState createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  File? _image;
  String? profileImage;
  String? phoneNumber;
  String? name;
  String? apiToken;
  String? imageUploadStatus;

  TextEditingController userName = TextEditingController();
  TextEditingController userPhoneNumber = TextEditingController();

  _imageFromCamera() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    // .pickImage(source: ImageSource.camera, imageQuality: 50);

    if (image != null) {
      setState(() {
        _image = File(image.path);
        Navigator.pop(context);
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

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          didChangeDependencies();
          return SafeArea(
              child: Wrap(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close")),
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

  setUserProfileImage(changedImage) async {
    SharedPreferences p = await SharedPreferences.getInstance();
    setState(() {
      p.setString('profile_image', changedImage);
    });
  }

  getUserValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      profileImage = pref.getString('profile_image');
      name = pref.getString('name');
      phoneNumber = pref.getString('phone_number');
      apiToken = pref.getString("user_api_token");

      userName.text = name!;
      print(userName.text);
      userPhoneNumber.text = phoneNumber!;
      print(userPhoneNumber.text);
      print(profileImage);
    });

    // return a;
  }

  setUserName(a) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      pref.setString("name", a);
    });
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

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: displayHeight(context),
          width: displayWidth(context),
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Account",
                      style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 45.0),
                      child: Center(
                        child: _image != null
                            ? CircleAvatar(
                                radius: 60.0,
                                child: ClipRRect(
                                  child: Image.file(
                                    _image!,
                                    height: 150,
                                    width: 150,
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
                                        width: 150,
                                        height: 150,
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
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(150.0),
                                    ),
                                  ),
                      ),
                    ),
                    Positioned(
                        top: 135,
                        right: 117,
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
                Container(
                  margin: EdgeInsets.only(left: 20, top: 25),
                  height: displayHeight(context) * 0.066,
                  width: displayWidth(context) / 1.17,
                  decoration: Constants.containerstyle(),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: userName,
                    decoration: InputDecoration(
                      hintText: "Emma Sultan",
                      border: InputBorder.none,
                      prefixIcon: Image.asset(
                        "assets/images/Profile.png",
                        color: Colors.red,
                      ),
                      // suffixIcon: Image.asset("assets/images/Filter.png"),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 25),
                  height: displayHeight(context) * 0.066,
                  width: displayWidth(context) / 1.17,
                  decoration: Constants.containerstyle(),
                  child: TextField(
                    enabled: false,
                    controller: userPhoneNumber,
                    decoration: InputDecoration(
                      hintText: "3213515431",
                      border: InputBorder.none,
                      prefixIcon: Image.asset("assets/images/Call.png"),
                      // suffixIcon: Image.asset("assets/images/Filter.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.15,
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
                    final userUpdate = UpdateUserProfile();
                    // var res = '';

                    if (_image!.path.isNotEmpty) {
                      userUpdate
                          .uploadImage(_image!,
                              "https://portal.letsride.today/api/v1/restaurant/image-uploading?api_token=$apiToken")
                          .then((value) {
                        if (value == "Image_Uploaded") {
                          userUpdate.apiCallUserUpdate({
                            "api_token": apiToken,
                            "name": userName.text,
                            "email": "email1@email.com",
                          }).then((value) {
                            // set user name in shared prefference
                            setUserName(value.name);
                            // set image url in shared preffernce variable
                            setUserProfileImage(value.profileImg);

                            //  show message update successfully
                            _displaySuccessMotionToast(context, value.message);
                          });
                        }
                      });
                    } else {
                      userUpdate.apiCallUserUpdate({
                        "api_token": apiToken,
                        "name": userName.text,
                        "email": "email1@email.com",
                      }).then((value) {
                        setUserName(value.name);
                        _displaySuccessMotionToast(context, value.message);
                      });
                    }
                  },
                  textStyle: TextStyle(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: TabBarViewData(),
    );
  }
}
