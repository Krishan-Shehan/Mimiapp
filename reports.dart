import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 226, 234),
      body: Center(
        child: Stack(fit: StackFit.expand, clipBehavior: Clip.none, children: [
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
            top: 415,
            left: 40,
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
                onPressed: () {},
                child: const Text('Fluency Report'),
              ),
            ),
          ),
          Positioned(
            top: 515,
            left: 40,
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
                onPressed: () {},
                child: const Text('Progress Report'),
              ),
            ),
          ),
          Positioned(
            top: 615,
            left: 40,
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
                onPressed: () {},
                child: const Text('Full Report'),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
