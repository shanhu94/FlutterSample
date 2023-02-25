import 'dart:convert';
import 'dart:io';

import 'package:product_browser/config/network.dart';
import 'package:product_browser/model/home/home_list_model.dart';

class HomeListVM {
  int pageIndex = 1;
  List<HomeListModel> lists = [];

  void resetPageIndex() {
    pageIndex = 1;
  }

  void increasedPageIndex() {
    pageIndex += 1;
  }

  Future<void> requestData() async {
    try {
      final json = await Network().get(NetworkPath.homeList);
      final list = json["result"]["list"];
      if (pageIndex == 1) {
        lists.removeRange(0, lists.length);
      }
      for (int i = 0; i < list.length; i++) {
        Map <String, dynamic> map = list[i] as Map<String, dynamic>;
        var model = HomeListModel.fromJson(map);
        lists.add(model);
      }
    } catch (e) {
      print(e);
    }
  }
}
