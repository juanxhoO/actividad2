import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/model/user_model.dart';

class ApiService {
  Future<List<Users>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Users> _model = usersFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
