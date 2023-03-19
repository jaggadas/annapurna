import 'package:annapurna/screens/HomePage.dart';
import 'package:annapurna/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:annapurna/screens/LoginScreen.dart';
import 'package:annapurna/Animations/FadeAnimation.dart';
import '../utils/firebase.dart';

class OtpPage extends StatefulWidget {
  static const String id = 'otp_screen';
  static String verify = "";

  OtpPage(this.phoneNumber);

  String? phoneNumber;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String enteredOtp = "";
  bool codeSent = false;
  late String verificationId;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult, context);
    };
    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {};
    final PhoneCodeSent smsSent = (String verId, int? forceResend) {
      setState(() {
        print("hello");

        this.codeSent = true;
      });

      this.verificationId = verId;
    };
    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };
    await auth.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      timeout: const Duration(seconds: 30),
      verificationCompleted: verified,
      verificationFailed: verificationFailed,
      codeSent: smsSent,
      codeAutoRetrievalTimeout: autoTimeout,
    );
  }

  @override
  void initState() {
    verifyPhone(widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: kGrey,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: [Positioned(
                    child: FadeAnimation(
                      1.6,
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text(
                            "Verify Code",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                MediaQuery.of(context).size.height / 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 70.0, top: 100.0, bottom: 100.0, right: 70.0),
                      child: Image.asset(
                        'assets/images/verifyOtp.png',
                        width: MediaQuery.of(context).size.width / 1.7,
                        height: MediaQuery.of(context).size.height / 4,
                      ),
                    )
        ],
                ),

              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Column(
                  children: <Widget>[
                    FadeAnimation(
                      1.8,
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: kGrey,
                            borderRadius: BorderRadius.circular(10),
                            ),
                        child: Column(
                          children: <Widget>[
                            Pinput(
                              length: 6,
                              showCursor: true,
                              onChanged: (value) {
                                enteredOtp = value;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                      2,
                      GestureDetector(
                        onTap: () async {
                          if (enteredOtp.length == 6) {
                            if (codeSent) {
                              try {
                                await AuthService().signInWithOTP(
                                    enteredOtp, verificationId, context);
                              }
                              catch(e) {
                                print(e);
                              }
                            }
                          }
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(255, 169, 0, 1),
                                Color.fromRGBO(255, 169, 0, .6),
                              ])),
                          child: Center(
                            child: Text(
                              "Verify phone number",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    FadeAnimation(1.5, Text('The code was sent to:  ${widget.phoneNumber}', style: TextStyle(color: Colors.white),)),
                    FadeAnimation(
                      1.5,
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, LoginPage.id, (route) => false);
                          },
                          child: Text(
                            "Edit phone number",
                            style: TextStyle(
                              color: kMustard,
                            ),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
