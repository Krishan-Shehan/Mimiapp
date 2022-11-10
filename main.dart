import 'package:flutter/material.dart';
import 'package:flutter_application_1/activityMap.dart';
import 'package:flutter_application_1/dashboard1.dart';
import 'package:flutter_application_1/idea.dart';
import 'package:flutter_application_1/passwordRest.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/register.dart';
import 'package:flutter_application_1/therapyGames.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:rive/rive.dart';
import 'login.dart';
import 'home.dart';
import 'therapy.dart';
import 'page1.dart';
import 'reports.dart';
import 'profile.dart';
import 'dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'MiMi'),
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/1.png"), fit: BoxFit.cover),
      ),
      child: ActivityMap(),
      // child: Home(
      //   name: 'Krishan',
      // ),
    );
  }
}
