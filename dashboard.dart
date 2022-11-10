import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

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
              top: 0,
              left: 45,
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
              top: 300,
              left: 15,
              child: Container(
                height: 550,
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
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 30, 250, 0),
                          child: Text(
                            "Type 1",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontFamily: 'inter'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: LinearPercentIndicator(
                            // width: 140.0,
                            lineHeight: 27.0,
                            animation: true,
                            animationDuration: 2000,
                            percent: 0.9,
                            backgroundColor: Color.fromARGB(255, 60, 48, 86),
                            progressColor: Color.fromARGB(255, 13, 199, 177),
                            barRadius: const Radius.circular(100),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 250, 0),
                          child: Text(
                            "Type 2:",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontFamily: 'inter'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: LinearPercentIndicator(
                            // width: 140.0,
                            lineHeight: 27.0,
                            animation: true,
                            animationDuration: 2000,
                            percent: 0.5,
                            backgroundColor: Color.fromARGB(255, 60, 48, 86),
                            progressColor: Color.fromARGB(255, 13, 199, 177),
                            barRadius: const Radius.circular(100),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 250, 0),
                          child: Text(
                            "Type 3",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontFamily: 'inter'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: LinearPercentIndicator(
                            // width: 140.0,
                            lineHeight: 27.0,
                            animation: true,
                            animationDuration: 2000,
                            percent: 0.4,
                            backgroundColor: Color.fromARGB(255, 60, 48, 86),
                            progressColor: Color.fromARGB(255, 13, 199, 177),
                            barRadius: const Radius.circular(100),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 250, 0),
                          child: Text(
                            "Type 4",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontFamily: 'inter'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: LinearPercentIndicator(
                            // width: 140.0,
                            lineHeight: 27.0,
                            animation: true,
                            animationDuration: 2000,
                            percent: 0.6,
                            backgroundColor: Color.fromARGB(255, 60, 48, 86),
                            progressColor: Color.fromARGB(255, 13, 199, 177),
                            barRadius: const Radius.circular(100),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ///////////////////////////////////////////////////////////
                        SizedBox(
                          height: 250,
                          width: 250,
                          // child: Card(child: Text('box1')),
                          child: SfRadialGauge(
                            title: GaugeTitle(
                              text: 'Title',
                              // alignment: GaugeAlignment.near
                            ),
                            enableLoadingAnimation: true,
                            animationDuration: 4500,
                            axes: <RadialAxis>[
                              RadialAxis(
                                  startAngle: 180,
                                  endAngle: 0,
                                  showLabels: false,
                                  showAxisLine: false,
                                  showTicks: false,
                                  minimum: 0,
                                  maximum: 99,
                                  ranges: <GaugeRange>[
                                    GaugeRange(
                                        startValue: 0,
                                        endValue: 33,
                                        color: Color(0xFFFE2A25),
                                        ////////label: ' ' ' ' ' ' ' '
                                        sizeUnit: GaugeSizeUnit.factor,
                                        labelStyle: const GaugeTextStyle(
                                            fontFamily: 'Times', fontSize: 15),
                                        startWidth: 0.30,
                                        endWidth: 0.30),
                                    GaugeRange(
                                      startValue: 33,
                                      endValue: 66,
                                      color: Color(0xFFFFBA00),
                                      //////label: ' ' ' ' ' ' 'Moderate',
                                      labelStyle: const GaugeTextStyle(
                                          fontFamily: 'Times', fontSize: 15),
                                      startWidth: 0.30,
                                      endWidth: 0.30,
                                      sizeUnit: GaugeSizeUnit.factor,
                                    ),
                                    GaugeRange(
                                      startValue: 66,
                                      endValue: 99,
                                      color: Color(0xFF00AB47),
                                      //////label: ' ' ' ' ' ' 'Fast',
                                      labelStyle: const GaugeTextStyle(
                                          fontFamily: 'Times', fontSize: 15),
                                      sizeUnit: GaugeSizeUnit.factor,
                                      startWidth: 0.30,
                                      endWidth: 0.30,
                                    ),
                                  ],
                                  pointers: <GaugePointer>[
                                    NeedlePointer(
                                        value: 60,
                                        needleEndWidth: 7,
                                        needleColor:
                                            Color.fromARGB(255, 87, 93, 251)),
                                  ])
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 250,
                          width: 250,
                          // child: Card(child: Text('box1')),
                          child: SfRadialGauge(
                            title: GaugeTitle(
                              text: 'Title',
                              // alignment: GaugeAlignment.near
                            ),
                            enableLoadingAnimation: true,
                            animationDuration: 4500,
                            axes: <RadialAxis>[
                              RadialAxis(
                                  startAngle: 180,
                                  endAngle: 0,
                                  showLabels: false,
                                  showAxisLine: false,
                                  showTicks: false,
                                  minimum: 0,
                                  maximum: 99,
                                  ranges: <GaugeRange>[
                                    GaugeRange(
                                        startValue: 0,
                                        endValue: 33,
                                        color: Color(0xFFFE2A25),
                                        ////////label: ' ' ' ' ' ' ' '
                                        sizeUnit: GaugeSizeUnit.factor,
                                        labelStyle: const GaugeTextStyle(
                                            fontFamily: 'Times', fontSize: 15),
                                        startWidth: 0.30,
                                        endWidth: 0.30),
                                    GaugeRange(
                                      startValue: 33,
                                      endValue: 66,
                                      color: Color(0xFFFFBA00),
                                      //////label: ' ' ' ' ' ' 'Moderate',
                                      labelStyle: const GaugeTextStyle(
                                          fontFamily: 'Times', fontSize: 15),
                                      startWidth: 0.30,
                                      endWidth: 0.30,
                                      sizeUnit: GaugeSizeUnit.factor,
                                    ),
                                    GaugeRange(
                                      startValue: 66,
                                      endValue: 99,
                                      color: Color(0xFF00AB47),
                                      //////label: ' ' ' ' ' ' 'Fast',
                                      labelStyle: const GaugeTextStyle(
                                          fontFamily: 'Times', fontSize: 15),
                                      sizeUnit: GaugeSizeUnit.factor,
                                      startWidth: 0.30,
                                      endWidth: 0.30,
                                    ),
                                  ],
                                  pointers: <GaugePointer>[
                                    NeedlePointer(
                                        value: 60,
                                        needleEndWidth: 7,
                                        needleColor:
                                            Color.fromARGB(255, 87, 93, 251)),
                                  ])
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 250,
                          width: 250,
                          // child: Card(child: Text('box1')),
                          child: SfRadialGauge(
                            title: GaugeTitle(
                              text: 'Title',
                              // alignment: GaugeAlignment.near
                            ),
                            enableLoadingAnimation: true,
                            animationDuration: 4500,
                            axes: <RadialAxis>[
                              RadialAxis(
                                  startAngle: 180,
                                  endAngle: 0,
                                  showLabels: false,
                                  showAxisLine: false,
                                  showTicks: false,
                                  minimum: 0,
                                  maximum: 99,
                                  ranges: <GaugeRange>[
                                    GaugeRange(
                                        startValue: 0,
                                        endValue: 33,
                                        color: Color(0xFFFE2A25),
                                        ////////label: ' ' ' ' ' ' ' '
                                        sizeUnit: GaugeSizeUnit.factor,
                                        labelStyle: const GaugeTextStyle(
                                            fontFamily: 'Times', fontSize: 15),
                                        startWidth: 0.30,
                                        endWidth: 0.30),
                                    GaugeRange(
                                      startValue: 33,
                                      endValue: 66,
                                      color: Color(0xFFFFBA00),
                                      //////label: ' ' ' ' ' ' 'Moderate',
                                      labelStyle: const GaugeTextStyle(
                                          fontFamily: 'Times', fontSize: 15),
                                      startWidth: 0.30,
                                      endWidth: 0.30,
                                      sizeUnit: GaugeSizeUnit.factor,
                                    ),
                                    GaugeRange(
                                      startValue: 66,
                                      endValue: 99,
                                      color: Color(0xFF00AB47),
                                      //////label: ' ' ' ' ' ' 'Fast',
                                      labelStyle: const GaugeTextStyle(
                                          fontFamily: 'Times', fontSize: 15),
                                      sizeUnit: GaugeSizeUnit.factor,
                                      startWidth: 0.30,
                                      endWidth: 0.30,
                                    ),
                                  ],
                                  pointers: <GaugePointer>[
                                    NeedlePointer(
                                        value: 60,
                                        needleEndWidth: 7,
                                        needleColor:
                                            Color.fromARGB(255, 87, 93, 251)),
                                  ])
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 250,
                          width: 250,
                          // child: Card(child: Text('box1')),
                          child: SfRadialGauge(
                            title: GaugeTitle(
                              text: 'Title',
                              // alignment: GaugeAlignment.near
                            ),
                            enableLoadingAnimation: true,
                            animationDuration: 4500,
                            axes: <RadialAxis>[
                              RadialAxis(
                                  startAngle: 180,
                                  endAngle: 0,
                                  showLabels: false,
                                  showAxisLine: false,
                                  showTicks: false,
                                  minimum: 0,
                                  maximum: 99,
                                  ranges: <GaugeRange>[
                                    GaugeRange(
                                        startValue: 0,
                                        endValue: 33,
                                        color: Color(0xFFFE2A25),
                                        ////////label: ' ' ' ' ' ' ' '
                                        sizeUnit: GaugeSizeUnit.factor,
                                        labelStyle: const GaugeTextStyle(
                                            fontFamily: 'Times', fontSize: 15),
                                        startWidth: 0.30,
                                        endWidth: 0.30),
                                    GaugeRange(
                                      startValue: 33,
                                      endValue: 66,
                                      color: Color(0xFFFFBA00),
                                      //////label: ' ' ' ' ' ' 'Moderate',
                                      labelStyle: const GaugeTextStyle(
                                          fontFamily: 'Times', fontSize: 15),
                                      startWidth: 0.30,
                                      endWidth: 0.30,
                                      sizeUnit: GaugeSizeUnit.factor,
                                    ),
                                    GaugeRange(
                                      startValue: 66,
                                      endValue: 99,
                                      color: Color(0xFF00AB47),
                                      //////label: ' ' ' ' ' ' 'Fast',
                                      labelStyle: const GaugeTextStyle(
                                          fontFamily: 'Times', fontSize: 15),
                                      sizeUnit: GaugeSizeUnit.factor,
                                      startWidth: 0.30,
                                      endWidth: 0.30,
                                    ),
                                  ],
                                  pointers: <GaugePointer>[
                                    NeedlePointer(
                                        value: 60,
                                        needleEndWidth: 7,
                                        needleColor:
                                            Color.fromARGB(255, 87, 93, 251)),
                                  ])
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
