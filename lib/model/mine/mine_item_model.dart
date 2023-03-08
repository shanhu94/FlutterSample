enum MineItemType {
  line,
  grid,
  unknown;

  String toJson() => name;
  static MineItemType fromJson(String name) {
    late MineItemType type;
    try {
      type = MineItemType.values.byName(name);
    } catch (e) {
      type = MineItemType.unknown;
    }
    return type;
  }
}

class MineItemModel {
  late MineItemType type;

  MineItemModel.fromJson(Map<String, dynamic> json)
      : type = MineItemType.fromJson(json['type'] as String? ?? '');

  static MineItemModel factory(Map<String, dynamic> json) {
    MineItemType type = MineItemType.fromJson(json['type'] as String? ?? '');
    if (type == MineItemType.line) {
      return MineLineItemModel.fromJson(json);
    } else if (type == MineItemType.grid) {
      return MineGridItemModel.fromJson(json);
    } else {
      return MineItemModel.fromJson(json);
    }
  }
}

class MineLineItemModel extends MineItemModel {
  late String icon;
  late String title;
  late String actionUrl;

  MineLineItemModel.fromJson(Map<String, dynamic> json)
      : icon = json['icon'] as String? ?? '',
        title = json['title'] as String? ?? '',
        actionUrl = json['actionUrl'] as String? ?? '',
        super.fromJson(json);
}

class MineGridSubItemModel {
  late String icon;
  late String title;
  late String actionUrl;

  MineGridSubItemModel.fromJson(Map<String, dynamic> json)
      : icon = json['icon'] as String? ?? '',
        title = json['title'] as String? ?? '',
        actionUrl = json['actionUrl'] as String? ?? '';
}

class MineGridItemModel extends MineItemModel {
  late String title;
  late String subTitle;
  late List<MineGridSubItemModel> subItems;

  MineGridItemModel.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String? ?? '',
        subTitle = json['subTitle'] as String? ?? '',
        subItems = (json['subItems'] as List<dynamic>? ?? [])
            .map((e) => MineGridSubItemModel.fromJson(e))
            .toList(),
        super.fromJson(json);
}
