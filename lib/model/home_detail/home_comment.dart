
class HomeComment {
  late String icon;
  late String nickname;
  late String content;

  HomeComment.fromJson(Map<String, dynamic> json):
   icon = (json['icon'] as String?) ?? '',
   nickname = json['nickname'] as String? ?? '',
   content = json['content'] as String? ?? '';
  
  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'nickname': nickname,
      'content': content
    };
  }
}