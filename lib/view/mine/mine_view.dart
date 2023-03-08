import 'package:flutter/material.dart';
import 'package:product_browser/model/mine/mine_item_model.dart';
import 'package:product_browser/model/mine/mine_model.dart';
import 'package:product_browser/model/user/user.dart';
import 'package:product_browser/view/mine/mine_grid_view.dart';
import 'package:product_browser/view/mine/mine_line_view.dart';
import 'package:product_browser/view_model/mine_vm.dart';
import 'package:provider/provider.dart';

class MineView extends StatefulWidget {
  const MineView({super.key});

  @override
  State<StatefulWidget> createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
  final vm = MineVM();
  MineModel? model;

  @override
  void initState() {
    super.initState();
    _requestData();
  }

  Future<void> _requestData() async {
    final tmpModel = await vm.requestData();
    if (tmpModel != null) {
      setState(() {
        model = tmpModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: ListView(
        children: [
          header(context),
          if (model != null) ...list(context),
        ],
      ),
    );
  }

  Widget header(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 22, bottom: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              context.watch<User>().icon,
              width: 100,
              height: 100,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'images/default_icon.jpeg',
                width: 100,
                height: 100,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 7),
            child: Text(
              context.watch<User>().nickname,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> list(BuildContext context) {
    return model!.list
        .where((element) => element.type != MineItemType.unknown)
        .map((e) {
      if (e is MineLineItemModel) {
        return MineLineView(model: e);
      } else if (e is MineGridItemModel) {
        return MineGridView(model: e);
      } else {
        return Text('unknown');
      }
    }).toList();
  }
}
