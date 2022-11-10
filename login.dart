import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/http_service.dart';
import 'package:rive/rive.dart';
import 'package:flutter_application_1/service/api_dio.dart';

// import 'package:flutter/material.dart';
// import 'service/http_service.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// // import 'package:http_services/http_services.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   late String email;
//   late String password;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text('Login Page')),
//         body: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//           child: Column(
//             children: [
//               TextField(
//                 obscureText: false,
//                 decoration: InputDecoration(hintText: 'email'),
//                 onChanged: (value) {
//                   setState(() {
//                     email = value;
//                   });
//                 },
//               ),
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(hintText: 'password'),
//                 onChanged: (value) {
//                   setState(() {
//                     password = value;
//                   });
//                 },
//               ),
//               InkWell(
//                   onTap: () async {
//                     print(password);
//                     print(email);
//                     await HttpService.login(email, password, context);
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 10),
//                     child: const Center(
//                       child: Text(
//                         "Login",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, color: Colors.white),
//                       ),
//                     ),
//                     height: 50,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(25)),
//                   ))
//             ],
//           ),
//         )
//         // ignore: avoid_unnecessary_containers
//         );
//   }
// }

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Login> {
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 214, 226, 234),
        backgroundColor: Colors.transparent,
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
                    top: 380,
                    right: -65,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 180, 20),
                        child: TextButton(
                          onPressed: null,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 15,
                            ),
                          ),
                        )),
                  ),
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
                        onPressed: () {
                          print("loged");
                        },
                        child: Text('Log in'),
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
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 35, 220, 0),
                            child: Text(
                              "Name",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontFamily: 'inter'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SizedBox(
                              width: 300,
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_circle,
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
                                onChanged: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 200, 0),
                            child: Text("Password", textAlign: TextAlign.right),
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
                                  onChanged: (value) {
                                    setState(() {
                                      password = value;
                                    });
                                  },
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 180, 20),
                              child: TextButton(
                                onPressed: () async {
                                  print("clicked");

                                  await apiDio.login(email, password, context);

                                  // await HttpService.login(
                                  //     email, password, context);
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
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
