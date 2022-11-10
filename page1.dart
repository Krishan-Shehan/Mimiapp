import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 226, 234),
      body: Center(
          child:
              Stack(fit: StackFit.expand, clipBehavior: Clip.none, children: [
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
              height: 134,
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
              //       child: CustomScrollView(
              //         slivers: <Widget>[
              //           SliverGrid(
              //             gridDelegate:
              //                 const SliverGridDelegateWithMaxCrossAxisExtent(
              //               maxCrossAxisExtent: 200.0,
              //               mainAxisSpacing: 10.0,
              //               crossAxisSpacing: 10.0,
              //               childAspectRatio: 4.0,
              //             ),
              //             delegate: SliverChildBuilderDelegate(
              //               (BuildContext context, int index) {
              //                 return Container(
              //                   alignment: Alignment.center,
              //                   color: Colors.teal[100 * (index % 9)],
              //                   child: Text('Grid Item $index'),
              //                 );
              //               },
              //               childCount: 20,
              //             ),
              //           ),
              //           SliverFixedExtentList(
              //             itemExtent: 50.0,
              //             delegate: SliverChildBuilderDelegate(
              //               (BuildContext context, int index) {
              //                 return Container(
              //                   alignment: Alignment.center,
              //                   color: Colors.lightBlue[100 * (index % 9)],
              //                   child: Text('List Item $index'),
              //                 );
              //               },
              //             ),
              //           ),
              //         ],
              //       ),
            )),
        Positioned(
            top: 480,
            left: 15,
            child: Container(
              height: 134,
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
              child: Column(children: []),
            )),
        Positioned(
            top: 680,
            left: 15,
            child: Container(
              height: 134,
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
              child: Column(children: []),
            )),
        Positioned(
            top: 880,
            left: 15,
            child: Container(
              height: 134,
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
              child: Column(children: []),
            )),
        //
      ])),
    );
  }
}
