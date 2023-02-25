import 'package:flutter/material.dart';
import 'package:product_browser/model/home_detail/home_comment.dart';

class HomeDetailCommentCell extends StatelessWidget {
  final HomeComment comment;
  const HomeDetailCommentCell({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'images/default_icon.jpeg',
                width: 44,
                height: 44,
              );
            },
          ),
        ),
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
