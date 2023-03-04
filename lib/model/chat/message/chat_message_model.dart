import 'package:flutter/material.dart';
import 'package:product_browser/model/user/user.dart';
import 'package:provider/provider.dart';

enum ChatMessageDirection {
  left,
  right,
  middle,

  /// uid不正常
  error,
}

enum ChatMessageType {
  text,
  unknown;

  String toJson() => name;
  static ChatMessageType fromJson(String name) {
    late ChatMessageType type;
    try {
      type = values.byName(name);
    } catch (e) {
      type = ChatMessageType.unknown;
    }
    return type;
  }
}

class ChatMessageModel {
  late String sendId;
  late String receiveId;
  late ChatMessageType type;
  // 时间戳毫秒
  late int time;

  ChatMessageDirection direction(BuildContext context) {
    String uid = context.read<User>().uid;
    if (uid != sendId && uid != receiveId) {
      return ChatMessageDirection.error;
    }
    if (type == ChatMessageType.unknown) {
      return ChatMessageDirection.middle;
    }
    if (sendId == uid) {
      return ChatMessageDirection.left;
    } else if (receiveId == uid) {
      return ChatMessageDirection.right;
    } else {
      return ChatMessageDirection.error;
    }
  }

  ChatMessageModel({
    required this.sendId,
    required this.receiveId,
    required this.type,
    required this.time,
  });

  ChatMessageModel.fromJson(Map<String, dynamic> json)
      : type = ChatMessageType.fromJson(json['type'] as String? ?? ''),
        sendId = json['sendId'] as String? ?? '',
        receiveId = json['receiveId'] as String? ?? '',
        time = json['time'] as int? ?? 0;

  Widget cardView(BuildContext context) {
    return Text(
      '该版本不支持此卡片内容, 请升级到最新版',
      style: TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
        fontSize: 12,
      ),
    );
  }
}
