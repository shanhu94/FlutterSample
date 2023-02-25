
import 'package:product_browser/config/network.dart';
import 'package:product_browser/model/home/home_list_model.dart';
import 'package:product_browser/model/home_detail/home_comment.dart';

class HomeDetailVM {

  HomeListModel? content;
  List<HomeComment>? comments;

  Future<void> requestData() async {
    final json = await Network().get(NetworkPath.homeDetail);
    final tmpContent = json['result']['content'];
    content = HomeListModel.fromJson(tmpContent);
    final tmpComments = json['result']['comment'] as List<dynamic>;
    comments = tmpComments.map((e) => HomeComment.fromJson(e)).toList();
  }
}