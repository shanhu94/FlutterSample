import 'package:flutter/material.dart';

class HomeLabelView extends StatelessWidget {
  final String label;
  const HomeLabelView({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.onBackground),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(right: 13, bottom: 4),
      padding: const EdgeInsets.only(left: 8, top: 2, right: 8, bottom: 2),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12),
        // 文本超出后省略..., 这样文本只会显示1行
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}