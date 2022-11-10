import 'package:flutter/material.dart';
import 'package:flutter_application_1/sidebarpage.dart';
import 'package:flutter_application_1/therapy.dart';
import 'package:rive/rive.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'dart:math' as math show pi;

// class Home1 extends StatefulWidget {
//   final String name;

//   const Home1({super.key, required this.name});

//   @override
//   State<Home1> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<Home1> {
//   @override
//   Widget build(BuildContext context) {
//     String var1 = widget.name;
//     return Scaffold(
//       backgroundColor: Colors.red,
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Flexible(child: SidebarPage(name: '$var1')),
//                 // Expanded(
//                 //   child: Container(
//                 //     child: Center(
//                 //       child: Container(
//                 //         color: Colors.red,
//                 //         width: 400,
//                 //         child: Text('Content'),
//                 //       ),
//                 //     ),
//                 //     // color: Colors.black26,
//                 //   ),
//                 // ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class Home extends StatelessWidget {
  final String name;
  const Home({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 214, 226, 234),
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              // right: 0,
              child: Center(
                child: SizedBox(
                  width: 310,
                  // height: 800,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: 220,
                        left: 100,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: ConstrainedBox(
                            // width: 200,
                            constraints: new BoxConstraints(
                              minHeight: 75.0,
                              minWidth: 200.0,
                              maxHeight: 75.0,
                              // maxWidth: 300,
                              // maxWidth: 200.0,
                            ),
                            child: Container(
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
                              child: Center(
                                child: Text(
                                  "Hi! $name",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontFamily: 'inter',
                                    fontSize: 36,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 250,
                        left: 50,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: SizedBox(
                            width: 311,
                            height: 351,
                            child: RiveAnimation.asset(
                              'assets/mimi_v2.riv',
                              controllers: [SimpleAnimation('idle')],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 229,
                        left: 55,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: SizedBox(
                            width: 300,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(16), // <-- Radius
                                ),
                                backgroundColor:
                                    Color.fromARGB(255, 70, 216, 146),
                              ),
                              onPressed: () {
                                print("object fk");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Therapy()),
                                );
                                // MaterialPageRoute(
                                //   builder: (context) => Therapy(),
                                // );
                              },
                              child: const Text('PLAY'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              child: SidebarPage(
                name: name,
              ),
            ),
          ],
        ),
      ),
      // body: SidebarPage(
      //   name: '$name',
      // ),
    );
  }
}


// ------------------------------

// class SidebarPage extends StatefulWidget {
//   @override
//   _SidebarPageState createState() => _SidebarPageState();
// }

// class _SidebarPageState extends State<SidebarPage> {
//   late List<CollapsibleItem> _items;
//   late String _headline;
//   // String get name => this.name;
//   // AssetImage _avatarImg = AssetImage('assets/man.png');

//   @override
//   void initState() {
//     super.initState();
//     _items = _generateItems;
//     _headline = _items.firstWhere((item) => item.isSelected).text;
//   }

//   List<CollapsibleItem> get _generateItems {
//     return [
//       CollapsibleItem(
//         text: 'Home',
//         icon: Icons.home,
//         onPressed: () => setState(() => _headline = 'Home'),
//         isSelected: true,
//       ),
//       CollapsibleItem(
//         text: 'Dashboard',
//         icon: Icons.assessment,
//         onPressed: () => setState(() => _headline = 'DashBoard'),
//       ),
//       CollapsibleItem(
//         text: 'Reports',
//         icon: Icons.assignment,
//         onPressed: () => setState(() => _headline = 'Reports'),
//       ),
//       CollapsibleItem(
//         text: 'insights',
//         icon: Icons.insights,
//         onPressed: () => setState(() => _headline = 'insights'),
//       ),
//       CollapsibleItem(
//         text: 'Map',
//         icon: Icons.location_pin,
//         onPressed: () => setState(() => _headline = 'insights'),
//       ),
//       CollapsibleItem(
//         text: 'Settings',
//         icon: Icons.settings,
//         onPressed: () => setState(() => _headline = 'Settings'),
//       ),
//       CollapsibleItem(
//         text: 'LogOut',
//         icon: Icons.logout,
//         onPressed: () => setState(() => _headline = 'insights'),
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     //  String var1 = widget.name;
//     return SafeArea(
//       child: CollapsibleSidebar(
//         selectedIconColor: Color.fromARGB(255, 87, 93, 251),
//         selectedIconBox: Color.fromARGB(255, 115, 186, 234),
//         topPadding: 110,
//         screenPadding: 16,
//         borderRadius: 30.82,
//         height: 808,
//         // maxWidth: 68,
//         isCollapsed: MediaQuery.of(context).size.width <= 800,
//         items: _items,
//         // avatarImg: _avatarImg,
//         title: 'MiMi',
//         // onTitleTap: () {
//         //   ScaffoldMessenger.of(context).showSnackBar(
//         //       SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
//         // },
//         body: _body(size, context),
//         backgroundColor: Color.fromARGB(255, 214, 226, 234),
//         // selectedTextColor: Color.fromARGB(255, 87, 93, 251),
//         textStyle: const TextStyle(
//           fontSize: 15,
//           fontStyle: FontStyle.italic,
//         ),

//         // titleStyle: const TextStyle(
//         //     fontSize: 20,
//         //     fontStyle: FontStyle.italic,
//         //     fontWeight: FontWeight.bold),
//         // toggleTitleStyle: TextStyle(
//         //   fontSize: 20,
//         //   fontWeight: FontWeight.bold,
//         // ),
//         sidebarBoxShadow: [
//           BoxShadow(
//             color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
//             blurRadius: 72.43,
//             spreadRadius: 0,
//             offset: Offset(5.35, 11.5),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _body(Size size, BuildContext context) {
//     // String name = this.name;
//     return Center(
//         // child: Stack(
//         //   fit: StackFit.expand,
//         //   clipBehavior: Clip.none,
//         //   children: [
//         //     Positioned(
//         //       top: 200,
//         //       left: 100,
//         //       child: Padding(
//         //         padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//         //         child: Text(
//         //           "Mimi",
//         //           textAlign: TextAlign.right,
//         //           style: TextStyle(fontFamily: 'inter', fontSize: 36),
//         //         ),
//         //       ),
//         //     ),
//         //     Positioned(
//         //       child: Padding(
//         //         padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//         //         child: SizedBox(
//         //           width: 311,
//         //           height: 351,
//         //           child: RiveAnimation.asset(
//         //             'assets/mimi_v2.riv',
//         //             controllers: [SimpleAnimation('idle')],
//         //           ),
//         //         ),
//         //       ),
//         //     ),
//         //     Positioned(
//         //       bottom: 220,
//         //       left: 15,
//         //       child: Padding(
//         //         padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//         //         child: SizedBox(
//         //           width: 300,
//         //           height: 50,
//         //           child: ElevatedButton(
//         //             style: ElevatedButton.styleFrom(
//         //               shape: RoundedRectangleBorder(
//         //                 borderRadius: BorderRadius.circular(16), // <-- Radius
//         //               ),
//         //               backgroundColor: Color.fromARGB(255, 70, 216, 146),
//         //             ),
//         //             onPressed: () {},
//         //             child: const Text('PLAY'),
//         //           ),
//         //         ),
//         //       ),
//         //     ),
//         //   ],
//         // ),
//         );
//   }
// }
// child: Positioned(
//             child: Container(
//       width: double.infinity,
//       height: 600,
//       color: Colors.red,
//       child: Column(children: [
//         Padding(
//           padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
//           child: Text(
//             "Hi MiMi",
//             textAlign: TextAlign.right,
//             style: TextStyle(fontFamily: 'inter', fontSize: 36),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//           child: SizedBox(
//             width: 311,
//             height: 351,
//             child: RiveAnimation.asset(
//               'assets/mimi_v2.riv',
//               controllers: [SimpleAnimation('idle')],
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//           child: Container(
//             width: 300,
//             height: 50,
//             // color: Colors.red,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16), // <-- Radius
//                 ),
//                 backgroundColor: Color.fromARGB(255, 87, 93, 251),
//               ),
//               onPressed: () {},
//               child: const Text('Log in'),
//             ),
//           ),
//         ),
//       ]),
//     ))