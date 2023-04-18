import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:sports_app/helper/custom_button.dart';
import 'package:sports_app/helper/my_circule.dart';
import 'package:sports_app/helper/navigate.dart';
import 'package:sports_app/helper/textfiled_page.dart';
import 'package:sports_app/screens/forget_screen.dart';
import 'package:sports_app/screens/signup_screen.dart';

import '../dashboard/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String? firebaseerror;
  bool isPass = true;
  _signin() async {
    Progress.MyCircular(context, true);
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passController.text)
          .then((value) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => DashBoardScreen()),
            (route) => true);
      }).whenComplete(() {
        MotionToast.success(
                animationType: AnimationType.fromLeft,
                title: Text('Success'),
                description: Text('Login Successfully'))
            .show(context);
      });
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          firebaseerror = "Your email address is invalid.";
          break;
        case "wrong-password":
          firebaseerror = "Your password is wrong.";
          break;
        case "user-not-found":
          firebaseerror = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          firebaseerror = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          firebaseerror = "Too many requests";
          break;
        case "operation-not-allowed":
          firebaseerror = "Signing in with Email and Password is not enabled.";
          break;
        default:
          firebaseerror = "An undefined Error happened.";
      }
      Navigator.pop(context);
      MotionToast.error(
        width: 300,
        description: Text('$firebaseerror'),
      ).show(context);
    }
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
            SingleChildScrollView(
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.73,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hello',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Please login to your account',
                        ),
                        CustomTextField(
                          hintText: 'Email',
                          isPassword: false,
                          keyboard: TextInputType.emailAddress,
                          controller: emailController,
                          icon: Icon(Icons.email),
                          validate: (v) {
                            if (v!.isEmpty) {
                              return 'Enter Your Email';
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
                          controller: passController,
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
                        InkWell(
                          onTap: () {
                            goTo(context, ForgetScreen());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Forgot password?',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ),
                        CustomButton('Login', () {
                          if (formKey.currentState!.validate()) {
                            _signin();
                          } else {
                            MotionToast.info(
                                    description: Text(
                                        'Please Enter Your Email & Password'))
                                .show(context);
                          }
                        }),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
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
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.height * 0.05,
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
                                  )),
                            ),
                            Container(
                              child: FaIcon(
                                FontAwesomeIcons.facebook,
                                size: 27,
                                color: Colors.blue,
                              ),
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.11,
                            ),
                            Container(
                              child: FaIcon(
                                FontAwesomeIcons.twitter,
                                size: 28,
                                color: Colors.blue,
                              ),
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.13,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                              ),
                              InkWell(
                                onTap: () {
                                  goTo(context, SignupScreen());
                                },
                                child: Text(
                                  'Register Now',
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
