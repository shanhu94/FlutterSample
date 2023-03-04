import 'package:flutter/material.dart';
import 'package:product_browser/model/chat/message/chat_message_model.dart';
import 'package:product_browser/model/chat/chat_model.dart';
import 'package:product_browser/view/chat_detail/chat_detail_cell.dart';
import 'package:product_browser/view/chat_detail/chat_detail_input_view.dart';
import 'package:product_browser/view_model/chat_detail_vm.dart';

class ChatDetailView extends StatefulWidget {
  final ChatModel model;
  const ChatDetailView({super.key, required this.model});

  @override
  State<StatefulWidget> createState() => _ChatDetailViewState();
}

class _ChatDetailViewState extends State<ChatDetailView> {
  List<ChatMessageModel> list = [];
  ChatDetailVM vm = ChatDetailVM();

  @override
  void initState() {
    super.initState();
    _request();
  }

  Future<void> _request() async {
    await vm.request();
    setState(() {
      list = vm.list;
    });
  }

  Future<void> _onSendText(String text) async {
    await vm.sendText(text);
    setState(() {
      list = vm.list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          widget.model.name,
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primary,
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return ChatDetailCell(model: list[index]);
                    },
                  ),
                ),
              ),
              ChatDetailInputView(
                onSend: _onSendText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
