import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class User extends ChangeNotifier with DiagnosticableTreeMixin {
  String _uid = '';
  String get uid => _uid;

  String _icon = '';
  String get icon => _icon;

  String _nickname = '未知';
  String get nickname => _nickname;

  void changeUid(String uid) {
    _uid = uid;
    notifyListeners();
  }

  void changeIcon(String icon) {
    _icon = icon;
    notifyListeners();
  }

  void changeNickname(String nickname) {
    _nickname = nickname;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('uid', uid));
  }
}
