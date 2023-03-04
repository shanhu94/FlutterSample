
import 'package:product_browser/config/network.dart';
import 'package:product_browser/model/chat/chat_model.dart';

class ChatVM {
  List <ChatModel> list = [];

  Future<void> request() async {
    final json = await Network().get(NetworkPath.chatList);
    final tmpList = json['result']['list'] as List<dynamic>;
    list = tmpList.map((e) => ChatModel.fromJson(e)).toList();
  }
}