import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class PasswordRest extends StatelessWidget {
  const PasswordRest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 214, 226, 234),
        body: Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child: Center(
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: <Widget>[
                  Positioned(
                    top: 325,
                    right: -25,
                    child: Container(
                      width: 343,
                      height: 56,
                      // color: Colors.red,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(16), // <-- Radius
                          ),
                          backgroundColor: Color.fromARGB(255, 87, 93, 251),
                        ),
                        onPressed: () {},
                        child: const Text('Reset'),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 200,
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
                    right: -25,
                    child: Container(
                      height: 312,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 226, 234),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 72.4,
                            offset: Offset(10.35, 11.5),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 35, 220, 0),
                            child: Text(
                              "New Password",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontFamily: 'inter'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SizedBox(
                              width: 300,
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(16.0),
                                    ),
                                    borderSide: BorderSide(
                                        width: 1.5,
                                        color:
                                            Color.fromARGB(255, 87, 93, 251)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 10, 200, 0),
                            child: Text("Re-Type Password",
                                textAlign: TextAlign.right),
                          ),
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                width: 300,
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(16.0),
                                        ),
                                        borderSide: BorderSide(
                                            width: 1.5,
                                            color: Color.fromARGB(
                                                255, 87, 93, 251))),
                                  ),
                                ),
                              )),

                          // Padding(
                          //   padding: EdgeInsets.fromLTRB(0, 0, 220, 10),
                          //   child: TextButton(
                          //     style: TextButton.styleFrom(
                          //       textStyle: TextStyle(fontSize: 20),
                          //     ),
                          //     onPressed: null,
                          //     child: Text('Simple Button'),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
