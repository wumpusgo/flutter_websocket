import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<List<String>> getUsers() async {
    try {
      var url = Uri.http('10.0.2.2:8080', 'clients');
      var httpResponse = await http.get(url);
      var decodedResponse = jsonDecode(httpResponse.body);
      return decodedResponse;
    } on Exception catch (error) {
      print(error.toString());
      return ["error"];
    }
  }
}
