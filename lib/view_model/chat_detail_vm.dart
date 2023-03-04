import 'package:product_browser/config/network.dart';
import 'package:product_browser/model/chat/message/chat_message_factory.dart';
import 'package:product_browser/model/chat/message/chat_message_model.dart';
import 'package:product_browser/model/chat/message/chat_text_message.dart';

class ChatDetailVM {
  List<ChatMessageModel> list = [];

  Future<void> request() async {
    try {
      final json = await Network().get(NetworkPath.messageList);
      final tmpList = json['result']['list'] as List<dynamic>;
      list = tmpList
          .map((e) => messageRelationMap[
              ChatMessageType.fromJson(e['type'] as String)]!(e))
          .toList();
    } catch (e) {
      list = [];
    }
  }

  Future<void> sendText(String text) async {
    //
    // await sendMessage(model);
  }

  Future<void> sendMessage(ChatMessageModel model) async {
    list.add(model);
  }
}
