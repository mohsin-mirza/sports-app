import 'package:flutter/material.dart';
import 'package:sports_app/helper/custom_button.dart';
import 'package:sports_app/helper/textfiled_page.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  bool isPass = true;

  _submit() {
    if (formKey.currentState!.validate()) {
      print('Login Success');
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
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.6,
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
                        'Reset Your Password',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Please confirm Your Email',
                        ),
                      ),
                      CustomTextField(
                        hintText: 'Email',
                        isPassword: false,
                        keyboard: TextInputType.emailAddress,
                        controller: emailC,
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
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton('Send', () {
                        _submit();
                      }),
                      SizedBox(
                        height: 25,
                      ),
                      Text('Please Check your Email'),
                    ],
                  )),
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
