
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiConsumer {
  Future<Response> post({required String uri, required rawData, String? token}) async {
    http.Response response = await http.post(
      Uri.parse(uri),
      body: rawData,
      headers: token != null ? {'Authorization': 'Bearer $token'} : null,
    );
    return response;
  }

  Future<Response> get({required String uri, String? token}) async {
    http.Response response = await http.get(
      Uri.parse(uri),
      headers: token != null ? {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'} : null,
      // headers: {'Content-Type': 'application/json'},
    );

    print(response.body);
    return response;
  }

  // Future<String> delete({required String uri, String? token}) async {
  //   final url = Uri.parse(uri);
  //   final request = http.Request("DELETE", url);
  //   request.headers.addAll(<String, String>{'Authorization': 'Bearer $token'});
  //   final response = await request.send();
  //   return await response.stream.bytesToString();

  // }

  Future<Response> delete({required String uri, String? token}) async {
    http.Response response = await http.delete(
      Uri.parse(uri),
      headers: token != null ? {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'} : null,
      // headers: {'Content-Type': 'application/json'},
    );

    return response;
  }

  put({required String uri, required rawData, String? token}) async {
    http.Response response = await http.put(
      Uri.parse(uri),
      body: rawData,
      headers: token != null ? {'Authorization': 'Bearer $token'} : null,
    );
    return response;
  }
}
