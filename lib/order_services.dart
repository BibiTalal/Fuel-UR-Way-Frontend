import 'package:http/http.dart' as http;

class SearchService {
  static Future<String> orderlistApi(String user) async {
    String url = 'http://127.0.0.1:8000g/et/order/?username=$user';
    http.Response response = await http.get(Uri.parse(url));
    return response.body;
  }
}
