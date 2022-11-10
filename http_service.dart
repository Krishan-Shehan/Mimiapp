import 'dart:convert';
// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:loginwithapi/views/dashboard.dart';
// import 'package:loginwithapi/views/welcome.dart';

class HttpService {
  static final _loginUrl = Uri.parse('http://10.0.2.2:5000/login');

  static final _registerUrl = Uri.parse('http://127.0.0.1:5000/register');

  static predict(path, context) async {
    print(path);

    var request = http.MultipartRequest(
        'POST', Uri.parse('http://10.0.2.2:5000/predict'));
    request.files.add(await http.MultipartFile.fromPath('file', path));

    var res = await request.send();

    // return res.reasonPhrase;
    if (res.statusCode == 200) {
      print(res.reasonPhrase);
    }
  }

  static login(username, pass, context) async {
    final response = await http.post(_loginUrl, body: {
      'uname': username,
      'passw': pass,
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json[1]);
      if (json[0] == 'Login Sucessfully') {
        await EasyLoading.showSuccess(json[0]);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(
              name: 'Krishan',
            ),
          ),
        );
      } else {
        EasyLoading.showError(json[0]);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }

  static register(username, email, pass, context) async {
    //sending a post request to the url
    final response = await http.post(_registerUrl, body: {
      'uname': username,
      'mail': email,
      'passw': pass,
    });

    if (response.statusCode == 200) {
      print(response.body);
      var json = jsonDecode(response.body);
      print(json);
      // print(json['status']);
      if (json == 'username already exist') {
        await EasyLoading.showError(json);
      } else {
        // await EasyLoading.showSuccess(json['status']);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Home(
                      name: 'mimi',
                    )));
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
}
