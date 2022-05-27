import 'dart:developer';

import 'package:aiolos/view/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/constant widgets/buttonwidget.dart';
import '../core/constant widgets/textwidget.dart';
import '../core/constant widgets/txtbox.dart';
import '../theme/theme.dart';

class PhoneNumber extends StatelessWidget {
  PhoneNumber({Key? key}) : super(key: key);

  final TextEditingController numberController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String verifyId = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/background.jpg"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(25)),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 28.0, bottom: 40),
                          child: TextWidget(
                            txt: "Aiolos Cloud",
                            size: 35,
                            weight: FontWeight.bold,
                            clr: white.withOpacity(0.7),
                            fam: GoogleFonts.viga().fontFamily,
                          ),
                        ),
                        TxtField(
                          icon: const Icon(Icons.person, color: white),
                          controller: numberController,
                          hint: "Phone Number",
                          type: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            if (value.toString().length < 10 ||
                                value.toString().length > 10) {
                              return 'Invalid Phone Number';
                            }
                            return null;
                          },
                        ),
                        ButtonWidget(
                            txt: "Continue",
                            ontap: () async {
                              if (_formKey.currentState!.validate()) {
                                verifyNumber(context);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.blue,
                                        insetPadding: const EdgeInsets.all(15),
                                        title: const TextWidget(
                                            txt: "Verify your OTP"),
                                        content: OtpTextField(
                                          onSubmit: (value) async {
                                            try {
                                              final success =
                                                  await verifycode(value);
                                              if (success
                                                  .toString()
                                                  .isNotEmpty) {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (ctx) =>
                                                            const HomePage()));
                                              }
                                            } on FirebaseAuthException {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      backgroundColor: white,
                                                      content: TextWidget(
                                                          clr: black,
                                                          txt: "Invalid OTP")));

                                              Navigator.pop(context);
                                            }
                                          },
                                          borderWidth: 4.0,
                                          numberOfFields: 6,
                                          borderColor: const Color(0xFF512DA8),
                                        ),
                                        actions: [
                                          ButtonWidget(
                                              txt: "cancel",
                                              ontap: () {
                                                Navigator.pop(context);
                                              })
                                        ],
                                      );
                                    });
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void verifyNumber(BuildContext context) {
    auth.verifyPhoneNumber(
        phoneNumber: "+91${numberController.text}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            log("logged in successfully");
          });
        },
        verificationFailed: (FirebaseAuthException exception) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: white,
              content: TextWidget(
                  clr: black,
                  txt: "Please check your Phone Number and try again")));
          Navigator.pop(context);
        },
        codeSent: (String verificationID, int? resendToken) {
          verifyId = verificationID;
        },
        codeAutoRetrievalTimeout: (String verificationID) {});
  }

  Future<UserCredential> verifycode(String code) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verifyId, smsCode: code);
    final userCredential = await auth.signInWithCredential(credential);
    return userCredential;
  }
}
