import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/api_dio.dart';
import 'package:rive/rive.dart';
import 'package:record/record.dart';

class Therapy extends StatefulWidget {
  // final void Function(String path) onStop;
  // const Therapy({Key? key, required this.onStop}) : super(key: key);
  const Therapy({super.key});

  @override
  State<Therapy> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Therapy> {
  int _recordDuration = 0;
  Timer? _timer;
  final _audioRecorder = Record();
  StreamSubscription<RecordState>? _recordSub;
  RecordState _recordState = RecordState.stop;
  StreamSubscription<Amplitude>? _amplitudeSub;
  Amplitude? _amplitude;

  @override
  void initState() {
    _recordSub = _audioRecorder.onStateChanged().listen((recordState) {
      setState(() => _recordState = recordState);
    });

    _amplitudeSub = _audioRecorder
        .onAmplitudeChanged(const Duration(milliseconds: 300))
        .listen((amp) => setState(() => _amplitude = amp));

    super.initState();
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        // We don't do anything with this but printing
        final isSupported = await _audioRecorder.isEncoderSupported(
          AudioEncoder.wav,
        );
        if (kDebugMode) {
          print('${AudioEncoder.wav.name} supported: $isSupported');
        }

        // final devs = await _audioRecorder.listInputDevices();
        // final isRecording = await _audioRecorder.isRecording();

        await _audioRecorder.start(
          path:
              '/data/user/0/com.example.flutter_application_1/cache/audio69.wav',
          encoder: AudioEncoder.wav, // by default
          bitRate: 130000, // by default
          samplingRate: 44100,
        );
        _recordDuration = 0;

        _startTimer();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _stop() async {
    _timer?.cancel();
    _recordDuration = 0;

    final path = await _audioRecorder.stop();

    print(path);
    apiDio.predict(path, context);
    // HttpService.predict(path, context);
  }

  // Future<void> _pause() async {
  //   _timer?.cancel();
  //   await _audioRecorder.pause();
  // }

  // Future<void> _resume() async {
  //   _startTimer();
  //   await _audioRecorder.resume();
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
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
              height: 490,
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
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                  child: Image.asset('assets/ac.jpeg'),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    "Activity descriptions ",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontFamily: 'inter'),
                  ),
                ),
              ]),
            ),
          ),
          Positioned(
            width: 56,
            height: 56,
            bottom: 60,
            left: 165,
            child: _buildRecordStopControl(),
          )
          // Positioned(
          //   width: 80,
          //   height: 80,
          //   bottom: 60,
          //   left: 165,
          //   // right: 50,
          //   child: MaterialButton(
          //     onPressed: () {
          //       _start();
          //     },
          //     color: Color.fromARGB(255, 70, 216, 146),
          //     textColor: Colors.white,
          //     child: Icon(
          //       Icons.mic,
          //       size: 24,
          //     ),
          //     padding: EdgeInsets.all(16),
          //     shape: CircleBorder(),
          //   ),
          // ),
          // _buildRecordStopControl(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _recordSub?.cancel();
    _amplitudeSub?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  Widget _buildRecordStopControl() {
    late Icon icon;
    late Color color;

    if (_recordState != RecordState.stop) {
      icon = const Icon(Icons.stop, color: Colors.white, size: 30);
      color = Colors.red.withOpacity(0.9);
    } else {
      icon = const Icon(Icons.mic, color: Colors.white, size: 30);
      color = const Color.fromARGB(255, 70, 216, 146);
    }

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          child: SizedBox(width: 56, height: 56, child: icon),
          onTap: () {
            (_recordState != RecordState.stop) ? _stop() : _start();
          },
        ),
      ),
    );
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });
  }

  // Widget _buildPauseResumeControl() {
  //   if (_recordState == RecordState.stop) {
  //     return const SizedBox.shrink();
  //   }

  //   late Icon icon;
  //   late Color color;

  //   if (_recordState == RecordState.record) {
  //     icon = const Icon(Icons.pause, color: Colors.red, size: 30);
  //     color = Colors.red.withOpacity(0.1);
  //   } else {
  //     final theme = Theme.of(context);
  //     icon = const Icon(Icons.play_arrow, color: Colors.red, size: 30);
  //     color = theme.primaryColor.withOpacity(0.1);
  //   }

  //   return ClipOval(
  //     child: Material(
  //       color: color,
  //       child: InkWell(
  //         child: SizedBox(width: 56, height: 56, child: icon),
  //         onTap: () {
  //           (_recordState == RecordState.pause) ? _resume() : _pause();
  //         },
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildText() {
  //   if (_recordState != RecordState.stop) {
  //     return _buildTimer();
  //   }

  //   return const Text("Waiting to record");
  // }

  // Widget _buildTimer() {
  //   final String minutes = _formatNumber(_recordDuration ~/ 60);
  //   final String seconds = _formatNumber(_recordDuration % 60);

  //   return Text(
  //     '$minutes : $seconds',
  //     style: const TextStyle(color: Colors.red),
  //   );
  // }

  // String _formatNumber(int number) {
  //   String numberStr = number.toString();
  //   if (number < 10) {
  //     numberStr = '0' + numberStr;
  //   }

  //   return numberStr;
  // }

}



// class Therapy1 extends StatelessWidget {
//   Therapy1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 214, 226, 234),
//       body: Center(
//           child: Stack(
//         fit: StackFit.expand,
//         clipBehavior: Clip.none,
//         children: [
//           Positioned(
//             top: 20,
//             left: 50,
//             child: Container(
//               width: 311,
//               height: 351,
//               child: RiveAnimation.asset(
//                 'assets/mimi_v2.riv',
//                 controllers: [SimpleAnimation('idle')],
//               ),
//             ),
//           ),
//           Positioned(
//               top: 280,
//               left: 15,
//               child: Container(
//                 height: 490,
//                 width: 380,
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 214, 226, 234),
//                   borderRadius: BorderRadius.circular(25),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
//                       spreadRadius: 0,
//                       blurRadius: 72.4,
//                       offset: Offset(10.35, 11.5),
//                     ),
//                   ],
//                 ),
//                 child: Column(children: [
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
//                     child: Image.asset('assets/ac.jpeg'),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                     child: Text(
//                       "Activity descriptions ",
//                       textAlign: TextAlign.right,
//                       style: TextStyle(fontFamily: 'inter'),
//                     ),
//                   ),
//                 ]),
//               )),
//           Positioned(
//               width: 80,
//               height: 80,
//               bottom: 60,
//               left: 165,
//               // right: 50,
//               child: MaterialButton(
//                 onPressed: () {},
//                 color: Color.fromARGB(255, 70, 216, 146),
//                 textColor: Colors.white,
//                 child: Icon(
//                   Icons.mic,
//                   size: 24,
//                 ),
//                 padding: EdgeInsets.all(16),
//                 shape: CircleBorder(),
//               ))
//         ],
//       )),
//     );
//   }
// }
