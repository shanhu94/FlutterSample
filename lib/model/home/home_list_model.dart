
enum HomeListModelType {
  card,
  unknown;

  String toJson() => name;
  static HomeListModelType fromJson(String name) {
    late HomeListModelType type;
    try {
      type = values.byName(name);
    } catch (e) {
      type = HomeListModelType.unknown;
    }
    return type;
  } 
}

class HomeListModel {
  late HomeListModelType type;
  late String title;
  late String content;
  late List<String> labels;
  late String icon;

  HomeListModel.fromJson(Map<String, dynamic> json):
        type = HomeListModelType.fromJson(json['type'] as String? ?? 'unknown'),
        title = json['title'] as String? ?? '',
        content = json['content'] as String? ?? '',
        labels = (json['labels'] as List<dynamic>? ?? []).map((e) => e.toString()).toList(),
        icon = json['icon'] as String? ?? '';
}