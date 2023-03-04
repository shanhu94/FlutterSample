
class ChatModel {
  late String icon;
  late String name;
  late String lastMsgContent;

  ChatModel.fromJson(Map<String, dynamic> json):
  icon = json['icon'] as String? ?? '',
  name = json['name'] as String? ?? '',
  lastMsgContent = json['lastMsgContent'] as String? ?? '';
}