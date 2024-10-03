import 'package:employee_forums_harsh/model/posts_model.dart';
import 'package:http/http.dart' as http;

var base = "http://evika.onrender.com/";
Future<List<Event>> getPosts() async {
  Uri url = Uri.parse("$base/event");
  try {
    var res = await http.get(url);
    print("Response status: ${res.statusCode}");
    print("Response body: ${res.body}");
    if (res.statusCode == 200) {
      var data = postsModelFromJson(res.body);
      print("Parsed data: ${data.data.events}");
      return data.data.events ?? [];
    } else {
      print("Error: ${res.statusCode}");
      return [];
    }
  } catch (e) {
    print("Exception: ${e.toString()}");
    return [];
  }
}

