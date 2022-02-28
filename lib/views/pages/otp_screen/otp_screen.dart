import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
// import 'package:pinput/pin_put/pin_put.dart';

import 'package:restaurant_app/Models/AuthApi/AuthApiService.dart';
import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';
import 'package:restaurant_app/utills/customtextbutton.dart';
import 'package:restaurant_app/views/pages/HomeScreen/orders.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPSCREEN extends StatefulWidget {
  final String phone;
  OTPSCREEN(this.phone);

  // const OTPSCREEN({Key? key}) : super(key: key);

  @override
  _OTPSCREENState createState() => _OTPSCREENState();
}

class _OTPSCREENState extends State<OTPSCREEN> {
  late String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String? _firebaseToken;
  String? _currentTimeZone;

  final BoxDecoration pinPutDecoration = BoxDecoration(
    // color: const Color.fromRGBO(255, 255, 255, 1),
    // borderRadius: BorderRadius.circular(10.0),
    border: Border(
      bottom: BorderSide(width: 1, color: Colors.black),
      // color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  @override
  void initState() {
    super.initState();
    _verifyPhone();
    _firebaseMessaging.getToken().then((token) {
      _firebaseToken = token;
    });
    _gettimezone();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _setUserToken(apikey, profileImage, phoneNumber, name, email, login) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("user_api_token", apikey);
    pref.setString('phone_number', phoneNumber);
    pref.setString('profile_image', profileImage);
    pref.setString('name', name);
    pref.setString('email', email);
    pref.setString('login', login);
  }

  _gettimezone() async {
    _currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
    // return _currentTimeZone;
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${widget.phone}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if (value.user != null) {
            final String _currentTimeZone =
                await FlutterNativeTimezone.getLocalTimezone();
            _firebaseMessaging.getToken().then((token) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("/$token")));
            });
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("/$_currentTimeZone")));

            // Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(builder: (context) => HomeScreen()),
            //     (route) => false);
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("verification Failed.")));
      },
      codeSent: (String verficationID, int? resendToken) {
        setState(() {
          _verificationCode = verficationID;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('code sent section.')));
        });
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        setState(() {
          _verificationCode = verificationID;
        });
      },
      // timeout: Duration(seconds: 25),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: displayHeight(context) / 2,
              width: displayWidth(context),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.066,
                  ),
                  Image(image: AssetImage("assets/images/vendor_logo.png")),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.066,
                  ),
                  Text(
                    "OTP VERIFICATION" + widget.phone,
                    style: GoogleFonts.ubuntu(
                      textStyle: Constants.otp1style(),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.045,
                  ),
                  Text(
                    "Enter the OTP sent on your phone number",
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //second part of the screen
            Container(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.12,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
//remove comment
                        Padding(
                          padding: EdgeInsets.only(
                            left: 2.0,
                          ),
                          child: Pinput(
                            // obscureText: "*",
                            // hintText: "*",
                            fieldsCount: 6,
                            textStyle: const TextStyle(
                                fontSize: 25.0, color: Colors.black),
                            eachFieldWidth: 40.0,
                            eachFieldHeight: 55.0,
                            focusNode: _pinPutFocusNode,
                            controller: _pinPutController,
                            submittedFieldDecoration: pinPutDecoration,
                            selectedFieldDecoration: pinPutDecoration,
                            followingFieldDecoration: pinPutDecoration,
                            pinAnimationType: PinAnimationType.fade,
                            onSubmit: (pin) async {
                              try {
                                await FirebaseAuth.instance
                                    .signInWithCredential(
                                        PhoneAuthProvider.credential(
                                            verificationId: _verificationCode,
                                            smsCode: pin))
                                    .then((value) async {
                                  if (value.user != null) {
                                    await _firebaseMessaging
                                        .getToken()
                                        .then((token) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text("$token")));
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text("$_currentTimeZone")));
                                    final services = AuthApiServices();
                                    services.apiCallLogin(
                                      {
                                        "phone_number": '${widget.phone}',
                                        "fcm_token": '$_firebaseToken',
                                        "timezone": '$_currentTimeZone',
                                        "latitude": '56565.54',
                                        "longitude": '65465.164'
                                      },
                                    ).then((value) {
                                      if (value.apitoken != null) {
                                        _setUserToken(
                                          value.apitoken!,
                                          value.profileImage!,
                                          value.phoneNumber!,
                                          value.name,
                                          value.email,
                                          value.isLogin,
                                        );
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    OrderPage()),
                                            (route) => false);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(value.error!)));
                                      }
                                    });
                                  }
                                });
                              } catch (e) {
                                FocusScope.of(context).unfocus();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('invalid OTP')));
                                // _scaffoldkey.currentState!.showSnackBar(
                                // SnackBar(content: Text('invalid OTP')));
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: displayHeight(context) / 2 * 0.05,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 28),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Didn't received code?",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "resend",
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.4,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: CustomTextButton(
                      buttonName: 'VERIFY OTP',
                      buttonTextStyle: GoogleFonts.ubuntu(
                          textStyle: Constants.loginbuttonstyle()),
                      buttoncolor: Constants.black_light,
                      height: _height * 0.066,
                      width: displayWidth(context) * 0.9,
                      highlightColor: Constants.black_light,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OrderPage()),
                        );
                      },
                      textStyle: TextStyle(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
