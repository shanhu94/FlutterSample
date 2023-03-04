import 'package:flutter/material.dart';
import 'package:product_browser/model/chat/message/chat_message_model.dart';
import 'package:product_browser/model/chat/message/chat_text_message.dart';
import 'package:product_browser/view/chat_detail/message/chat_message_text_view.dart';

class ChatDetailCell extends StatelessWidget {
  final ChatMessageModel model;
  const ChatDetailCell({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: container(context),
    );
  }

  Widget container(BuildContext context) {
    if (model.direction(context) == ChatMessageDirection.left) {
      return left(context);
    } else if (model.direction(context) == ChatMessageDirection.right) {
      return right(context);
    } else if (model.direction(context) == ChatMessageDirection.middle) {
      return middle(context);
    } else {
      return error(context);
    }
  }

  Widget left(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          width: 30,
          height: 30,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          clipBehavior: Clip.hardEdge,
          child: Image.network(
            '',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              'images/default_icon.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
          child: messageContent(context),
        )
      ],
    );
  }

  Widget right(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15, bottom: 15, left: 15),
          child: messageContent(context),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          width: 30,
          height: 30,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          clipBehavior: Clip.hardEdge,
          child: Image.network(
            '',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              'images/default_icon.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget middle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          child: messageContent(context),
        ),
      ],
    );
  }

  Widget error(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          child: const Text('用户异常, 消息已不可见'),
        ),
      ],
    );
  }

  Widget messageContent(BuildContext context) {
    return model.cardView(context);
  }
}
