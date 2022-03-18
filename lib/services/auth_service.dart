import 'dart:convert';

import 'package:shamo/models/model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.body == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel userModel = UserModel.fromJson(data['user']);
      userModel.token = 'Bearer ' + data['access_token'];

      return userModel;
    } else {
      throw Exception();
    }
  }
}
