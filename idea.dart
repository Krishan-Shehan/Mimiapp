import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/activityMap.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:rive/rive.dart';

class Idea extends StatelessWidget {
  const Idea({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    double screenWidth = 390;
    return Center(
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 150,
            left: 10,
            child: Container(
              width: 390,
              height: 200,
              // color: Colors.red,
              child: ClipPath(
                clipper: ProsteThirdOrderBezierCurve(
                  position: ClipPosition.bottom,
                  list: [
                    ThirdOrderBezierCurveSection(
                      p1: Offset(0, 100),
                      p2: Offset(0, 200),
                      p3: Offset(screenWidth / 4, 100),
                      p4: Offset(screenWidth / 4, 200),
                    ),
                    ThirdOrderBezierCurveSection(
                      p1: Offset(screenWidth / 4, 200),
                      p2: Offset(screenWidth / 4, 100),
                      p3: Offset(screenWidth, 200),
                      p4: Offset(screenWidth, 110),
                    ),
                  ],
                ),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 176, 186, 192),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  // color: Color.fromARGB(255, 214, 226, 234)
                ),
              ),
            ),
          ),
          // Positioned(
          //   top: 190,
          //   left: 15,
          //   child: Container(
          //     height: 134,
          //     width: 380,
          //     decoration: BoxDecoration(
          //       color: Color.fromARGB(255, 214, 226, 234),
          //       borderRadius: BorderRadius.circular(25),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
          //           spreadRadius: 0,
          //           blurRadius: 72.4,
          //           offset: Offset(10.35, 11.5),
          //         ),
          //       ],
          //     ),
          //     child: Column(children: []),
          //   ),
          // ),
          Positioned(
            top: 250,
            left: 20,
            child: ClipOval(
              child: SizedBox.fromSize(
                size: Size.fromRadius(190),
                child: RiveAnimation.asset(
                  'assets/mimi_v2.riv',
                  controllers: [SimpleAnimation('idle')],
                ),
              ),
            ),
          ),
          Positioned(
            top: 640,
            left: 35,
            child: Container(
              width: 343,
              height: 56,
              // color: Colors.red,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16), // <-- Radius
                  ),
                  backgroundColor: Color.fromARGB(255, 87, 93, 251),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ActivityMap()),
                  );
                },
                child: const Text('Next'),
              ),
            ),
          ),
        ],
      ),
    );

    // return Container(
    //   child: ClipPath(
    //     clipper: ProsteThirdOrderBezierCurve(
    //       position: ClipPosition.bottom,
    //       list: [
    //         ThirdOrderBezierCurveSection(
    //           p1: Offset(0, 100),
    //           p2: Offset(0, 200),
    //           p3: Offset(screenWidth / 2, 100),
    //           p4: Offset(screenWidth / 2, 200),
    //         ),
    //         ThirdOrderBezierCurveSection(
    //           p1: Offset(screenWidth / 2, 200),
    //           p2: Offset(screenWidth / 2, 100),
    //           p3: Offset(screenWidth, 200),
    //           p4: Offset(screenWidth, 100),
    //         ),
    //       ],
    //     ),
    //     child: Container(
    //       height: 200,
    //       color: Colors.purple,
    //     ),
    //   ),
    // );
  }
}
