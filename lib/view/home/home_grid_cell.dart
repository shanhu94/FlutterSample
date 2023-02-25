import 'package:flutter/material.dart';
import 'package:product_browser/model/home/home_list_model.dart';
import 'package:product_browser/view/home/component/home_label_view.dart';

class HomeGridCell extends StatefulWidget {
  final HomeListModel model;
  const HomeGridCell({super.key, required this.model});

  @override
  State<StatefulWidget> createState() => _HomeGridCellState();
}

class _HomeGridCellState extends State<HomeGridCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      color: Theme.of(context).colorScheme.background,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AspectRatio(
          aspectRatio: 1.0,
          child: Image.network(
            widget.model.icon,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset('images/default_icon.jpeg');
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5, left: 8, right: 8, bottom: 5),
          child: Text(
            widget.model.title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 18,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 8, right: 8),
          child: Text(
            widget.model.content,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 14,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5, left: 8, right: 8, bottom: 5),
          child: SizedBox(
            height: 20,
            child: Wrap(
              clipBehavior: Clip.hardEdge,
              direction: Axis.horizontal,
              children: widget.model.labels
                  .map((e) => HomeLabelView(label: e))
                  .toList(),
            ),
          ),
        ),
      ]),
    );
  }
}
