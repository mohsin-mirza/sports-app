import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:sports_app/helper/custom_button.dart';
import 'package:sports_app/helper/my_circule.dart';
import 'package:sports_app/helper/navigate.dart';
import 'package:sports_app/helper/textfiled_page.dart';
import 'package:sports_app/screens/login_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  final userC = TextEditingController();
  final emailC = TextEditingController();
  final phoneC = TextEditingController();
  final passC = TextEditingController();
  final reTypeC = TextEditingController();
  var errorMessage;
  bool isPass = true;
  bool cPass = true;
  bool phLength = true;
  _submit() async {
    if (formKey.currentState!.validate()) {
      if (passC.text != reTypeC.text) {
        MotionToast.warning(
                width: 300,
                description:
                    Text('Password and Confirm Password Should be same'))
            .show(context);
      } else {
        if (passC.text == reTypeC.text) {
          Progress.MyCircular(context, true);
          try {
            await InternetAddress.lookup('google.com');
            try {
              FirebaseAuth auth = FirebaseAuth.instance;
              await auth
                  .createUserWithEmailAndPassword(
                      email: emailC.text, password: passC.text)
                  .whenComplete(
                    () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LoginScreen(),
                      ),
                    ),
                  );
            } on FirebaseAuthException catch (error) {
              switch (error.code) {
                case "ERROR_EMAIL_ALREADY_IN_USE":
                case "account-exists-with-different-credential":
                case "email-already-in-use":
                  errorMessage = "Email already used. Go to login page.";
                  break;
                case "ERROR_WRONG_PASSWORD":
                case "wrong-password":
                  errorMessage = "Wrong email/password combination.";
                  break;
                case "ERROR_USER_NOT_FOUND":
                case "user-not-found":
                  errorMessage = "No user found with this email.";
                  break;
                case "ERROR_USER_DISABLED":
                case "user-disabled":
                  errorMessage = "User disabled.";
                  break;
                case "ERROR_TOO_MANY_REQUESTS":
                case "operation-not-allowed":
                  errorMessage = "Too many requests to log into this account.";
                  break;
                case "ERROR_OPERATION_NOT_ALLOWED":
                  errorMessage = "Server error, please try again later.";
                  break;
                case "ERROR_INVALID_EMAIL":
                case "invalid-email":
                  errorMessage = "Email address is invalid.";
                  break;
                default:
                  errorMessage = "Login failed. Please try again.";
                  break;
              }
            }
          } catch (e) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                'Something went wrong check internet',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black,
            ));
          }
          if (errorMessage != null) {
            Navigator.pop(context);
            MotionToast.error(
                    animationType: AnimationType.fromRight,
                    width: 300,
                    description: Text('$errorMessage'))
                .show(context);
          } else {
            MotionToast.success(description: Text('Login Successfully'));
          }
        }
      }
    }
  }

  @override
  void dispose() {
    emailC.dispose();
    phoneC.dispose();
    passC.dispose();
    userC.dispose();
    reTypeC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Image.asset(
                    'assets/3.jpg',
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.6),
                    colorBlendMode: BlendMode.darken,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Center(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Text(
                            'Hello',
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Please Signup to your account',
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IntlPhoneField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              invalidNumberMessage:
                                  'enter correct mobile number',
                              initialValue: '+92',
                              disableLengthCheck: phLength,
                              onTap: () {
                                phLength = false;
                              },
                              dropdownIconPosition: IconPosition.trailing,
                              // flagsButtonMargin: EdgeInsets.all(8),
                              controller: phoneC,
                              showCountryFlag: true,
                              validator: (v) {
                                if (v!.number.isEmpty) {
                                  return 'please enter your phone';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                hintText: 'phone number',
                              ),
                              // decoration: InputDecoration(
                              //   contentPadding: EdgeInsets.symmetric(
                              //     horizontal: 10,
                              //   ),
                              //   isDense: true,
                              //   focusedBorder: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(11),
                              //     borderSide: BorderSide(color: Colors.green),
                              //   ),
                              //   enabledBorder: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(11),
                              //     borderSide: BorderSide(color: Colors.black),
                              //   ),
                              //   border: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(11),
                              //     borderSide: BorderSide(color: Colors.red),
                              //   ),
                              //   labelText: 'Phone Number',
                              //   labelStyle: TextStyle(color: Colors.black),
                              // ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: userC,
                              validator: (v) {
                                if (v!.isEmpty) {
                                  return 'please enter your name in small letters';
                                }

                                return null;
                              },
                              // textCapitalization: TextCapitalization.sentences,
                              keyboardType: TextInputType.name,
                              autofocus: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(
                                  RegExp('[0-9]'),
                                ),
                              ],
                              decoration: InputDecoration(
                                isDense: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                labelText: 'User Name',
                                labelStyle: TextStyle(color: Colors.black),
                                hintStyle: TextStyle(fontSize: 15),
                                suffixIcon: Icon(
                                  Icons.person,
                                  size: 18,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                              ),
                            ),
                          ),
                          CustomTextField(
                            hintText: 'Email Address',
                            isPassword: false,
                            keyboard: TextInputType.emailAddress,
                            controller: emailC,
                            icon: Icon(Icons.email),
                            validate: (v) {
                              if (v!.isEmpty) {
                                return 'enter Your email';
                              }
                              if (!(v.contains('@'))) {
                                return 'enter valid email address used @';
                              }
                              if (!(v.contains('.com'))) {
                                return 'enter valid email with .com';
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            hintText: 'Password',
                            isPassword: isPass,
                            validate: (v) {
                              if (v!.isEmpty) {
                                return 'please enter your password';
                              }
                              if (v.length < 8) {
                                return 'password length should be 8';
                              }
                              return null;
                            },
                            controller: passC,
                            icon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPass = !isPass;
                                });
                              },
                              icon: isPass
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),
                          ),
                          CustomTextField(
                            hintText: 'Confirm Password',
                            isPassword: cPass,
                            validate: (v) {
                              if (v!.isEmpty) {
                                return 'please enter your password';
                              }
                              if (v.length < 8) {
                                return 'password length should be 8';
                              }
                              return null;
                            },
                            controller: reTypeC,
                            icon: IconButton(
                              onPressed: () {
                                setState(() {
                                  cPass = !cPass;
                                });
                              },
                              icon: cPass
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),
                          ),
                          CustomButton('Signup', () {
                            if (phoneC.text.isEmpty) {
                              MotionToast.error(
                                description:
                                    Text('Please Add Your Phone Number'),
                                animationType: AnimationType.fromLeft,
                                width: 300,
                              ).show(context);
                            } else {
                              _submit();
                            }
                          }),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              'Login Using',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: ShaderMask(
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (s) {
                                      return LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Colors.red,
                                            Colors.red,
                                            Colors.yellow,
                                            Colors.green,
                                            Colors.blue,
                                          ]).createShader(s);
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.google,
                                      size: 30,
                                    )),
                              ),
                              Container(
                                child: FaIcon(
                                  FontAwesomeIcons.facebook,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.11,
                              ),
                              Container(
                                child: FaIcon(
                                  FontAwesomeIcons.twitter,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.13,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: dynamicHeight(context, 0.02),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 11),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already a user?',
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => LoginScreen()));
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.03,
              left: MediaQuery.of(context).size.height * -0.001,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
