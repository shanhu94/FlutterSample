import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class User extends ChangeNotifier with DiagnosticableTreeMixin {
  String _uid = '';
  String get uid => _uid;

  void changeUid(String uid) {
    _uid = uid;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('uid', uid));
  }
}
