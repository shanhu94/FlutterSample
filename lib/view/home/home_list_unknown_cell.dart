import 'package:flutter/material.dart';

class HomeListUnknownCell extends StatelessWidget {
  const HomeListUnknownCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      margin: const EdgeInsets.only(top: 1),
      height: 50,
      alignment: AlignmentDirectional.center,
      child: Text(
        "该版本不支持此卡片内容, 请升级到最新版",
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }
}
