import 'package:flutter/material.dart';
import 'package:sports_app/helper/navigate.dart';
import 'package:sports_app/screens/login_screen.dart';
import 'package:sports_app/screens/signup_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAnimate = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1500), () {
      setState(() {
        _isAnimate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          AnimatedPositioned(
              duration: Duration(seconds: 1),
              top: MediaQuery.of(context).size.height * 0.025,
              bottom: MediaQuery.of(context).size.height * 0.024,
              left: _isAnimate
                  ? MediaQuery.of(context).size.width * -0.099
                  : MediaQuery.of(context).size.width,
              child: Image.asset('assets/1.png')),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.42,
            left: MediaQuery.of(context).size.width * 0.21,
            child: AnimatedContainer(
              width: _isAnimate
                  ? MediaQuery.of(context).size.width * 0.2
                  : MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.2,
              duration: Duration(seconds: 2),
              child: Image.asset(
                'assets/2.png',
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            top: MediaQuery.of(context).size.height * 0.82,
            right: _isAnimate
                ? MediaQuery.of(context).size.width * 0.1
                : MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                goTo(context, LoginScreen());
              },
              child: Text(
                'Get Started',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.80,
                      MediaQuery.of(context).size.height * 0.07),
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            top: MediaQuery.of(context).size.height * 0.91,
            left: _isAnimate
                ? MediaQuery.of(context).size.width * 0.2
                : MediaQuery.of(context).size.width,
            child: Row(
              children: [
                RichText(
                  text: TextSpan(text: 'Didn\'t have an cccount?'),
                ),
                TextButton(
                  onPressed: () {
                    goTo(context, SignupScreen());
                  },
                  child: Text(
                    'Signup',
                    style: TextStyle(color: Colors.red, fontSize: 17),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
