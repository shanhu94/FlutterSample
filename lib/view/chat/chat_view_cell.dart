import 'package:flutter/material.dart';
import 'package:product_browser/model/chat/chat_model.dart';

class ChatViewCell extends StatelessWidget {
  final ChatModel model;
  const ChatViewCell({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      margin: const EdgeInsets.only(top: 1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin:
                const EdgeInsets.only(left: 15, top: 7, bottom: 7, right: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(23)),
            clipBehavior: Clip.hardEdge,
            width: 46,
            height: 46,
            child: Image.network(
              model.icon,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Image.asset('images/default_icon.jpeg', fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 7, right: 15),
                  child: Text(
                    model.name,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 7, right: 15),
                  child: Text(
                    model.lastMsgContent,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
