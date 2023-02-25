import 'package:flutter/material.dart';
import 'package:product_browser/model/home/home_list_model.dart';
import 'package:product_browser/view/home/component/home_label_view.dart';

class HomeListCell extends StatefulWidget {
  final HomeListModel model;

  const HomeListCell({super.key, required this.model});

  @override
  State<StatefulWidget> createState() => _HomeListCellState();
}

class _HomeListCellState extends State<HomeListCell> {
  HomeListModel get model => widget.model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      margin: const EdgeInsets.only(top: 1),
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          // Description
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    model.content,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                // 取巧, 使用高度20截断换行的label
                SizedBox(
                  height: 20,
                  child: Wrap(
                    clipBehavior: Clip.hardEdge,
                    direction: Axis.horizontal,
                    children: model.labels
                        .map((e) => HomeLabelView(label: e))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              model.icon,
              width: 76,
              height: 76,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'images/default_icon.jpeg',
                  width: 76,
                  height: 76,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
