import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final String _hostUrl = 'https://daelim.fleecy.dev/functions/v1';
  static final String _signupUrl = '$_hostUrl/students/signup';

  static bool _enableOnce = false;

  static Future<bool?> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    if (_enableOnce) return null;
    _enableOnce = true;

    final response = await http.post(
      Uri.parse(_signupUrl),
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    final statusCode = response.statusCode;

    _enableOnce = true;

    debugPrint('Response [$statusCode]: ${response.body}');

    if (response.statusCode != 200) {
      return false;
    }
    return true;
  }
}
