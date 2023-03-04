import 'dart:convert';
import 'dart:io';

class NetworkPath {
  final String path;
  const NetworkPath(this.path);
  static NetworkPath get homeList => const NetworkPath('jsons/home.json');
  static NetworkPath get homeDetail => const NetworkPath('jsons/homeDetail.json');
  static NetworkPath get chatList => const NetworkPath('jsons/chatList.json');
  static NetworkPath get messageList => const NetworkPath('jsons/messageList.json');
}

class Network {
  final client = HttpClient();

  Uri uri(String path) {
    return Uri.parse('http://127.0.0.1:80/$path');
  }

  Future<dynamic> get(NetworkPath path) async {
    final request = await client.getUrl(uri(path.path));
    final response = await request.close();
    if (response.statusCode == 200) {
      final text = await response.transform(utf8.decoder).join();
      final json = jsonDecode(text);
      return json;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<dynamic> post(NetworkPath path, {Map<String, dynamic>? parameter}) async {
    final request = await client.postUrl(uri(path.path));
    if (parameter != null) {
      request.write(jsonEncode(parameter));
    }
    final response = await request.close();
    final text = await response.transform(utf8.decoder).join();
    final json = jsonDecode(text);
    return json;
  }
}


