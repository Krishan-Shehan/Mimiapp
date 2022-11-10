import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class TherapyGames extends StatelessWidget {
  const TherapyGames({super.key});

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
              top: 380,
              left: 15,
              child: Container(
                height: 400,
                width: 380,
                // decoration: BoxDecoration(
                //   color: Color.fromARGB(255, 214, 226, 234),
                //   borderRadius: BorderRadius.circular(25),
                //   boxShadow: [
                //     BoxShadow(
                //       color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                //       spreadRadius: 0,
                //       blurRadius: 72.4,
                //       offset: Offset(10.35, 11.5),
                //     ),
                //   ],
                // ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 130,
                            width: 169,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 214, 226, 234),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 0, 0, 0)
                                      .withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 72.4,
                                  offset: Offset(10.35, 11.5),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(16), // <-- Radius
                                ),
                                backgroundColor:
                                    // Color.fromARGB(255, 87, 93, 251),
                                    Color.fromARGB(255, 214, 226, 234),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Picture Description',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            height: 130,
                            width: 169,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 214, 226, 234),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 0, 0, 0)
                                      .withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 72.4,
                                  offset: Offset(10.35, 11.5),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(16), // <-- Radius
                                ),
                                backgroundColor:
                                    Color.fromARGB(255, 87, 93, 251),
                              ),
                              onPressed: () {},
                              child: const Text('Breathing Activity'),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 130,
                            width: 169,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 214, 226, 234),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 0, 0, 0)
                                      .withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 72.4,
                                  offset: Offset(10.35, 11.5),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(16), // <-- Radius
                                ),
                                backgroundColor:
                                    Color.fromARGB(255, 87, 93, 251),
                              ),
                              onPressed: () {},
                              child: const Text('Syallable Practising'),
                            ),
                          ),
                          Container(
                            height: 130,
                            width: 169,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 214, 226, 234),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 0, 0, 0)
                                      .withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 72.4,
                                  offset: Offset(10.35, 11.5),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(16), // <-- Radius
                                ),
                                backgroundColor:
                                    Color.fromARGB(255, 214, 226, 234),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Word Reading',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          )
                        ],
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
