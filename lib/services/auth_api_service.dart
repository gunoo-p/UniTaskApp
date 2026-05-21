import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:unitask/app/app_string.dart';
import 'package:unitask/core/models/result.dart';
import 'package:unitask/models/auth_data.dart';

class AuthApiService {
  final String _signupUrl = '${AppString.apiHostUrl}/students/signup';
  final String _loginUrl = '${AppString.apiHostUrl}/students/login';

  // 회원가입 api
  Future<Result<void>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(_signupUrl),
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );

      final statusCode = response.statusCode;

      if (response.statusCode != 200) {
        return Failure(Exception('계정 생성을 실패했습니다.'));
      }
      return const Success(null);
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  // 로그인 api
  Future<Result<AuthData>> login({
    required String email,
    required String password,
  }) async {
      try {
      final response = await http.post(
        Uri.parse(_loginUrl),
        body: jsonEncode({'email': email, 'password': password}),
      );

      final statusCode = response.statusCode;

      if (statusCode != 200) {
        debugPrint('로그인 API 에러 : ${response.body}');
        throw Failure(Exception('로그인을 실패했습니다.'));
      }

      debugPrint('로그인 API 성공');

      // TODO : 한 번 확인해보기
      final authData = AuthData.fromJson(response.body);

      return Success(authData);
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
