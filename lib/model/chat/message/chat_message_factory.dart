import 'package:product_browser/model/chat/message/chat_message_model.dart';
import 'package:product_browser/model/chat/message/chat_text_message.dart';

final Map<ChatMessageType, ChatMessageModel Function(Map<String, dynamic>)>
    messageRelationMap = {
  ChatMessageType.text: ChatTextMessage.fromJson,
  ChatMessageType.unknown: ChatMessageModel.fromJson
};
