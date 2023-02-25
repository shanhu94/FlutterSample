import 'package:flutter/material.dart';
import 'package:product_browser/model/home/home_list_model.dart';
import 'package:product_browser/view/home/home_list_cell.dart';
import 'package:product_browser/view/home/home_list_unknown_cell.dart';

class HomeListCellFactory extends StatefulWidget {
  final HomeListModel model;
  
  const HomeListCellFactory({super.key, required this.model});

  @override
  State<StatefulWidget> createState() => _HomeListCellFactoryState();

}

class _HomeListCellFactoryState extends State<HomeListCellFactory> {

  @override
  Widget build(BuildContext context) {
    if (widget.model.type == HomeListModelType.card) {
      return HomeListCell(model: widget.model);
    } else {
      return const HomeListUnknownCell();
    }
  }
}