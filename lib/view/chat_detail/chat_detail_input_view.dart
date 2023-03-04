import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatDetailInputView extends StatefulWidget {
  final void Function(String text) onSend;
  const ChatDetailInputView({super.key, required this.onSend});

  @override
  State<StatefulWidget> createState() => _ChatDetailInputViewState();
}

class _ChatDetailInputViewState extends State<ChatDetailInputView> {
  late TextEditingController controller;
  late FocusNode focusNode;

  @override
  void initState() {
    controller = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Theme.of(context).colorScheme.background,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.only(left: 10),
              padding:
                  const EdgeInsets.only(top: 6, left: 10, bottom: 6, right: 10),
              child: EditableText(
                controller: controller,
                focusNode: focusNode,
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                cursorColor: Theme.of(context).colorScheme.onBackground,
                backgroundCursorColor:
                    Theme.of(context).colorScheme.onBackground,
                onSubmitted: (value) {
                  widget.onSend(value);
                  controller.text = '';
                },
              ),
            ),
          ),
          IconButton(
            splashRadius: 1,
            icon: const Icon(Icons.emoji_emotions_outlined),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
