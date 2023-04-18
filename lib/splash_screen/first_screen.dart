import 'package:flutter/material.dart';
import 'package:sports_app/helper/navigate.dart';
import 'package:sports_app/splash_screen/second_screen.dart';
import 'package:sports_app/splash_screen/home_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/f.png',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                )),
            InkWell(
              onTap: () {
                goTo(context, HomeScreen());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.red.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        goTo(context, SecondScreen());
                      },
                      child: Text(
                        'Next',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
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
