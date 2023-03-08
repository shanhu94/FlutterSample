import 'package:product_browser/config/network.dart';
import 'package:product_browser/model/mine/mine_model.dart';

class MineVM {
  Future<MineModel?> requestData() async {
    try {
      final json = await Network().get(NetworkPath.mine);
      final mine = json['result'];
      return MineModel.fromJson(mine);
    } catch (e) {
      return null;
    }
  }
}
