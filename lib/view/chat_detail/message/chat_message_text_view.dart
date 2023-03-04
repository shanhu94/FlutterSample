import 'package:flutter/material.dart';
import 'package:product_browser/model/chat/message/chat_message_model.dart';
import 'package:product_browser/model/chat/message/chat_text_message.dart';

class ChatMessageTextView extends StatelessWidget {
  final ChatTextMessage model;
  const ChatMessageTextView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Text(model.content);
  }
}
