import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 226, 234),
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 20,
              left: 50,
              child: Container(
                width: 311,
                height: 351,
                child: RiveAnimation.asset(
                  'assets/mimi_v2.riv',
                  controllers: [SimpleAnimation('idle')],
                ),
              ),
            ),
            Positioned(
              top: 280,
              left: 15,
              child: Container(
                height: 336,
                width: 380,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 214, 226, 234),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 72.4,
                      offset: Offset(10.35, 11.5),
                    ),
                  ],
                ),
                child: Column(children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 220, 0),
                    child: Text(
                      "Name                            :",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontFamily: 'inter'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 220, 0),
                    child: Text(
                      "Age                                :",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontFamily: 'inter'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 220, 0),
                    child: Text(
                      "Gender                          :",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontFamily: 'inter'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 220, 0),
                    child: Text(
                      "Therapy Started Day :",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontFamily: 'inter'),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
