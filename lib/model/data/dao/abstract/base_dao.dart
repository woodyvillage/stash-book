import 'package:sqflite/sqflite.dart';
import 'package:stash_book/const/database_const.dart';
import 'package:stash_book/database/application_database.dart';
import 'package:stash_book/model/data/dao/account_dao.dart';
import 'package:stash_book/model/data/dao/possession_dao.dart';
import 'package:stash_book/model/data/dao/setting_dao.dart';

abstract class BaseDao {
  // DAOの種類から対象のテーブルを指定する
  String scope(dynamic dto) {
    if (dto is PossessionDao) {
      return DatabaseConst.tablePossession;
    } else if (dto is SettingDao) {
      return DatabaseConst.tableSetting;
    } else if (dto is AccountDao) {
      return DatabaseConst.tableAccount;
    } else {
      return "";
    }
  }

  Future<int?> count(dynamic dao) async {
    Database database = await ApplicationDatabase.database;
    return Sqflite.firstIntValue(await database.query(
      scope(dao),
      columns: ['count(*)'],
    ));
  }

  Future<int> insert(dynamic dao, dynamic dto) async {
    Database database = await ApplicationDatabase.database;
    return await database.insert(
      scope(dao),
      dto.toMap(),
    );
  }

  Future<int> update(dynamic dao, dynamic dto) async {
    Database database = await ApplicationDatabase.database;
    return await database.update(
      scope(dao),
      dto.toMap(),
    );
  }

  Future<int> insert(dynamic dto) async {
    Database database = await ApplicationDatabase.database;
    return await database.insert(
      scope(dto),
      dto.toMap(),
    );
  }
}
