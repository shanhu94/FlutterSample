import 'package:flutter/material.dart';
import 'package:product_browser/model/mine/mine_item_model.dart';

class MineGridView extends StatelessWidget {
  final MineGridItemModel model;
  const MineGridView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      color: Theme.of(context).colorScheme.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: model.subItems.map((e) => item(context, e)).toList(),
      ),
    );
  }

  Widget item(BuildContext context, MineGridSubItemModel item) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              item.icon,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                "images/default_icon.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            item.title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
