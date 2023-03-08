import 'package:flutter/material.dart';
import 'package:product_browser/model/mine/mine_item_model.dart';

class MineLineView extends StatelessWidget {
  final MineLineItemModel model;
  const MineLineView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
            clipBehavior: Clip.hardEdge,
            width: 36,
            height: 36,
            margin: const EdgeInsets.only(right: 10),
            child: Image.network(
              model.icon,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                "images/default_icon.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Text(
              model.title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 16,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
