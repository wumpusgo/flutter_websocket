import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:websocket_example/user.dart';

class UserRepository {
  Future<dynamic> getUsers() async {
    try {
      var url = Uri.http('10.0.2.2:8080', 'clients');
      var httpResponse = await http.get(url);
      var decodedResponse = User.fromMapList(jsonDecode(httpResponse.body));
      return decodedResponse;
    } on Exception catch (error) {
      return error.toString();
    }
  }
}
