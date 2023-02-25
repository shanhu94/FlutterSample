import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:product_browser/model/home/home_list_model.dart';
import 'package:product_browser/vendor/refresh_list/refresh_list_view.dart';
import 'package:product_browser/view/home/home_grid_cell.dart';
import 'package:product_browser/view/home/home_list_cell.dart';
import 'package:product_browser/view/home/home_list_cell_factory.dart';
import 'package:product_browser/view/home_detail/home_detail_view.dart';
import 'package:product_browser/view/refresh/refresh.dart';
import 'package:product_browser/view_model/home_list_vm.dart';

enum HomeViewStyle {
  list,
  grid;

  HomeViewStyle next() {
    var idx = (index + 1) % values.length;
    return values[idx];
  }
}

class HomeView extends StatefulWidget {
  final HomeViewStyle style;
  const HomeView({super.key, required this.style});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeListVM vm = HomeListVM();
  List<HomeListModel> lists = [];

  @override
  void initState() {
    super.initState();
    // 设置为0, 在测试时, 无法滚动
    _onRefresh();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _onRefresh() async {
    vm.resetPageIndex();
    await vm.requestData();
    setState(() {
      lists = vm.lists;
    });
  }

  Future<void> _onFooterRefresh() async {
    vm.increasedPageIndex();
    await vm.requestData();
    setState(() {
      lists = vm.lists;
    });
  }

  void _onItemTapAction(int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HomeDetailView(
          model: lists[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.style == HomeViewStyle.list) {
      return list(context);
    } else {
      return grid(context);
    }
  }

  Widget grid(BuildContext context) {
    return GridView.builder(
      // 注意设置 childAspectRatio, 来调整子视图的比例
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 220,
        childAspectRatio: 210.0 / 310.0,
      ),
      itemCount: lists.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _onItemTapAction(index),
          child: HomeGridCell(model: lists[index]),
        );
      },
    );
  }

  Widget list(BuildContext context) {
    return RefreshListView(
      header: (type) => RefreshHeader(type),
      headerRefresh: _onRefresh,
      footer: (type) => RefreshFooter(type),
      footerRefresh: _onFooterRefresh,
      itemCount: lists.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _onItemTapAction(index),
          child: HomeListCellFactory(
            model: lists[index],
          ),
        );
      },
    );
  }
}
