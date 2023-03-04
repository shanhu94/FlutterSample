import 'package:flutter/material.dart';
import 'package:product_browser/model/home_detail/home_comment.dart';

class HomeDetailCommentCell extends StatelessWidget {
  final HomeComment comment;
  const HomeDetailCommentCell({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(22),
          ),
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.all(11),
          child: Image.network(
            comment.icon,
            width: 44,
            height: 44,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'images/default_icon.jpeg',
                width: 44,
                height: 44,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        // 文本超出布局范围, 或其他元素超出布局范围, 可尝试使用Expanded限制其无限延伸的宽度或高度
        // Expanded 包住Column , 可以让Column内部的元素不会超出布局边缘
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 11, right: 11),
                child: Text(
                  comment.nickname,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 6, right: 11, bottom: 11),
                child: Text(
                  comment.content + comment.content,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
