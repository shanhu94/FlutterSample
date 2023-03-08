import 'package:product_browser/model/mine/mine_item_model.dart';

class MineModel {
  late List<MineItemModel> list;

  MineModel.fromJson(Map<String, dynamic> json)
      : list = (json['list'] as List<dynamic>? ?? [])
            .map((e) => MineItemModel.factory(e))
            .where((element) => element.type != MineItemType.unknown)
            .toList();
}
