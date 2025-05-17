import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:task_management/app.dart';
import 'package:task_management/ui/controllers/auth_controller.dart';
import 'package:task_management/ui/screens/login_screen.dart';

class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final Map<String, dynamic>? data;
  final String errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.data,
    this.errorMessage = 'Something Went Wrong',
  });
}

class NetworkClient {
  static final Logger _logger = Logger();
//----------------------------GET Request Start---------------------------------//
  static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {'token': AuthController.token ?? ''};
      _preRequestLog(url, headers);
      Response response = await get(uri, headers: headers);
      _postRequestLog(url, response.statusCode,
          headers: response.headers, responseBody: response.body);

      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            data: decodedJson);
      } else if (response.statusCode == 401) {
        _moveToLoginScreen();
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMessage: 'Un-authorize User. Please Login again !');
      } else {
        final decodedJson = jsonDecode(response.body);
        String errorMessage = decodedJson['data'] ?? 'Something went wrong';
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMessage: errorMessage);
      }
    } catch (e) {
      _postRequestLog(url, -1);
      return NetworkResponse(
          isSuccess: false, statusCode: -1, errorMessage: e.toString());
    }
  }
//----------------------------GET Request End---------------------------------//

//----------------------------POST Request Start---------------------------------//
  static Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'Content-type': 'Application/json',
        'token': AuthController.token ?? ''
      };
      _preRequestLog(url, headers, body: body);
      Response response = await post(uri,
          headers: headers,
          body: jsonEncode(
            body,
          ));
      _postRequestLog(url, response.statusCode,
          headers: response.headers, responseBody: response.body);
      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            data: decodedJson);
      } else if (response.statusCode == 401) {
        _moveToLoginScreen();
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMessage: 'Un-authorize User. Please Login again !');
      } else {
        final decodedJson = jsonDecode(response.body);
        String errorMessage = decodedJson['data'] ?? 'Something went wrong';
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMessage: errorMessage);
      }
    } catch (e) {
      _postRequestLog(url, -1, errorMassage: e.toString());
      return NetworkResponse(
          isSuccess: false, statusCode: -1, errorMessage: e.toString());
    }
//----------------------------POST Request End---------------------------------//
  }

  static void _preRequestLog(String url, Map<String, String> headers,
      {Map<String, dynamic>? body}) {
    _logger.i('URL=> $url\nHeaders: $headers '
        'Body" $body');
  }

  static void _postRequestLog(String url, int statusCode,
      {Map<String, dynamic>? headers,
      dynamic responseBody,
      dynamic errorMassage}) {
    if (errorMassage != null) {
      _logger.i(''
          'Url:$url\n '
          'Status Code:$statusCode\n '
          'Error Message: $errorMassage');
    } else {
      _logger.i(''
          'Url:$url\n '
          'Status Code:$statusCode\n '
          'Headers:$headers\n '
          'Response: $responseBody');
    }
  }

  static Future<void> _moveToLoginScreen() async {
    await AuthController.clearUserData();
    Navigator.pushAndRemoveUntil(
        TaskManagerApp.navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (predicate) => false);
  }
}
