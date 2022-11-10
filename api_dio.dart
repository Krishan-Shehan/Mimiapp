import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/idea.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// Response response;

var options = BaseOptions(
  baseUrl: 'http://10.0.2.2:5000',
  connectTimeout: 50000,
  receiveTimeout: 30000,
);

var dio = Dio(options);

class apiDio {
  static predict(path, context) async {
    print(path);

    var formData = FormData.fromMap(
      {
        'file': await MultipartFile.fromFile(path, filename: 'audio'),
      },
    );
    Response response = await dio.post('/typeidf', data: formData);

    if (response.data[0] == 'success') {
      await EasyLoading.showSuccess(response.data[0]);
      print(response.data[1]);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Idea(),
        ),
      );
    } else {
      EasyLoading.showError(response.data[0]);
    }

    print(response);
  }

  static login(username, pass, context) async {
    var formData = FormData.fromMap(
      {
        'uname': username,
        'passw': pass,
      },
    );

    Response response = await dio.post('/login', data: formData);

    if (response.data[0] == 'Login Sucessfully') {
      await EasyLoading.showSuccess(response.data[0]);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(
            name: 'Krishan',
          ),
        ),
      );
    } else {
      EasyLoading.showError(response.data[0]);
    }

    print(response.data[0]);
    // .then((response) => print(response.data[0]))
    // .catchError((error) => print(error));
  }
}
