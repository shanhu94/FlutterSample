import 'package:flutter/material.dart';
import 'package:product_browser/model/chat/chat_model.dart';
import 'package:product_browser/view/chat/chat_view_cell.dart';
import 'package:product_browser/view/chat_detail/chat_detail_view.dart';
import 'package:product_browser/view_model/chat_vm.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<StatefulWidget> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  List<ChatModel> list = [];
  ChatVM vm = ChatVM();

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ChatDetailView(model: list[index]),
            ));
          },
          child: ChatViewCell(model: list[index]),
        );
      },
    );
  }
}
