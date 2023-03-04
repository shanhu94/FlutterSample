import 'package:flutter/src/widgets/framework.dart';
import 'package:product_browser/model/chat/message/chat_message_model.dart';
import 'package:product_browser/view/chat_detail/message/chat_message_text_view.dart';

class ChatTextMessage extends ChatMessageModel {
  late String content;

  ChatTextMessage.fromJson(Map<String, dynamic> json)
      : content = json['content'] as String? ?? '',
        super.fromJson(json);

  @override
  Widget cardView(BuildContext context) {
    return ChatMessageTextView(model: this);
  }
}
