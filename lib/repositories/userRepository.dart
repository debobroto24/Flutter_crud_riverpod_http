import 'dart:convert';
import 'package:flutte_crud_riverpod_http/model/user_model.dart';
import 'package:flutte_crud_riverpod_http/utils/end_point.dart';
import 'package:http/http.dart' as http;

abstract class IUserRepositoy {
  Future<UserModel> fetchUserList();
}

class UserRepository implements IUserRepositoy {
  // final _host = "https://reqres.in/api/users";
  final Map<String, String> _headers = {
    "Accept": "application/json",
    "content-type": "app"
  };
  @override
  Future<UserModel> fetchUserList() async {
    var getAllUserUrl = API.BASE_URL + API.getAllUser;
    var results = await http.get(Uri.parse(getAllUserUrl), headers: _headers);
    final jsonObject = json.decode(results.body);
    var response = UserModel.fromJson(jsonObject);
    return response;
  }
}
