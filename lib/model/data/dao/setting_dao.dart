import 'package:sqflite/sqflite.dart';
import 'package:stash_book/const/database_const.dart';
import 'package:stash_book/database/application_database.dart';
import 'package:stash_book/model/data/dao/abstract/base_dao.dart';
import 'package:stash_book/model/data/dto/setting_dto.dart';

class SettingDao extends BaseDao {
  Future<List<SettingDto>> select() async {
    Database database = await ApplicationDatabase.database;
    List<Map<String, dynamic>> result =
        await database.query(DatabaseConst.tableSetting);
    List<SettingDto> dto = result.isNotEmpty
        ? result.map((item) => SettingDto.parse(item)).toList()
        : [];
    return dto;
  }
}
