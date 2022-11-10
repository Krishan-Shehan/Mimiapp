import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:path_drawing/path_drawing.dart';

class ActivityMap extends StatelessWidget {
  const ActivityMap({super.key});

  @override
  Widget build(BuildContext context) {
    // return FancyListView();
    return Scaffold(
      backgroundColor: Color.fromARGB(143, 199, 93, 93),
      body: FancyListView(),
    );

    // Scaffold(
    //   backgroundColor: Color.fromARGB(255, 214, 226, 234),
    //   // backgroundColor: Colors.transparent,

    //   body: Center(
    //     child: Stack(
    //       children: [
    //         Padding(
    //           padding: EdgeInsets.fromLTRB(20, 70, 20, 0),
    //           child: FancyListView(),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

class Point extends StatelessWidget {
  const Point({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: ClipOval(
            child: SizedBox.fromSize(
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                color: Colors.green,
                child: ElevatedButton(
                  onPressed: () {},
                  child: RiveAnimation.asset(
                    'assets/mimi_v2.riv',
                    controllers: [SimpleAnimation('idle')],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class FancyListView extends StatelessWidget {
  FancyListView({Key? key}) : super(key: key);

  // final double height = 80; //same as container

  TextStyle textStyle = TextStyle(
    fontSize: 24,
  );

  final int itemLength = 10;
  final int curentval = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: listview()),
        ],
      ),
    );
  }

  LayoutBuilder listview() {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/1.png"), fit: BoxFit.cover),
        ),
        width: constraints.maxWidth,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 70, 20, 0),
          child: ListView.builder(
            itemCount: itemLength,
            itemBuilder: (context, index) {
              // final textWidth = _textSize("Chapter $index", textStyle).width;

              // final painterWidth = constraints.maxWidth -
              //     ((textWidth + 20) *
              //         2); //24 for CircleAvatar, contains boths side

              return SizedBox(
                // height: index == itemLength - 1 ? 24 * 2 : 100 + 24,
                width: constraints.maxWidth,
                child: Stack(
                  children: [
                    /// skip render for last item
                    if (index != itemLength - 1)
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: CustomPaint(
                            painter:
                                DivPainter(index: index, curentval: curentval),
                          ),
                        ),
                      ),

                    Row(
                      mainAxisAlignment: index.isEven
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        // if (index.isEven)

                        if (curentval >= index) ...[
                          if (index == curentval) ...[
                            // Point()
                            Container(
                              width: 151,
                              height: 56,
                              // color: Colors.red,
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
                                child: Row(children: [
                                  Text("Level $index"),
                                  SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: RiveAnimation.asset(
                                      'assets/mimi_v2.riv',
                                      controllers: [SimpleAnimation('idle')],
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ] else ...[
                            Container(
                              width: 151,
                              height: 56,
                              // color: Colors.red,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(16), // <-- Radius
                                  ),
                                  backgroundColor:
                                      Color.fromARGB(255, 70, 216, 146),
                                ),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Level $index"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ] else ...[
                          Container(
                            width: 151,
                            height: 56,
                            // color: Colors.red,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(16), // <-- Radius
                                ),
                                backgroundColor:
                                    Color.fromARGB(255, 53, 62, 70),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Level $index"),
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   width: 60,
                          //   height: 60,
                          //   child: ClipOval(
                          //     child: SizedBox.fromSize(
                          //       child: Container(
                          //         color: Color.fromARGB(255, 53, 62, 70),
                          //         // child: ElevatedButton(
                          //         //   onPressed: () {},
                          //         //   child: Text(""),
                          //         // ),
                          //       ),
                          //     ),
                          //   ),
                          // )
                          // const CircleAvatar(radius: 35),
                        ],
                        // if (index.isOdd)
                        //   //
                        //   Container(
                        //     width: 100,
                        //     height: 56,
                        //     // color: Colors.red,
                        //     child: ElevatedButton(
                        //       style: ElevatedButton.styleFrom(
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius:
                        //               BorderRadius.circular(16), // <-- Radius
                        //         ),
                        //         backgroundColor: Color.fromARGB(255, 87, 93, 251),
                        //       ),
                        //       onPressed: () {},
                        //       child: Text(
                        //         "Activity $index",
                        //       ),
                        //     ),
                        //   ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class DivPainter extends CustomPainter {
  int index;
  int curentval;

  DivPainter({required this.index, required this.curentval});

  // num get curentval => curentval;
  // DivPainter({required this.curentval});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color.fromARGB(255, 8, 104, 56)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;
    Paint paint1 = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    final path1 = Path()
      ..moveTo(0, 45)
      ..lineTo(size.width, size.height + 15);

    final path2 = Path()
      ..moveTo(0, size.height + 15)
      ..lineTo(size.width, 45);

    if (index >= curentval) {
      index.isEven
          ? canvas.drawPath(
              dashPath(
                path1,
                dashArray: CircularIntervalList<double>(<double>[15.0, 10.5]),
              ),
              // path1,
              paint1)
          : canvas.drawPath(
              dashPath(
                path2,
                dashArray: CircularIntervalList<double>(<double>[15.0, 10.5]),
              ),
              paint1);
    } else {
      index.isEven
          ? canvas.drawPath(path1, paint)
          : canvas.drawPath(path2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
