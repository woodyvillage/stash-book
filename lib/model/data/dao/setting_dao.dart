import 'package:stash_book/const/database_const.dart';
import 'package:stash_book/model/data/dao/abstract/base_dao.dart';
import 'package:stash_book/model/data/dto/setting_dto.dart';

class SettingDao extends BaseDao<SettingDto> {
  @override
  String scope() => DatabaseConst.tableSetting;

  @override
  List<SettingDto> parseResult(List<Map<String, dynamic>> result) {
    return result.isNotEmpty
        ? result.map((item) => SettingDto.parse(item)).toList()
        : [];
  }

  Future<String> filter(String column, String keyword) async {
    List<SettingDto> result = await select(column, keyword);
    return result.isNotEmpty ? result[0].value : "";
  }
}
