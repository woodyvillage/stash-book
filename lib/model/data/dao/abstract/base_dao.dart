import 'package:sqflite/sqflite.dart';
import 'package:stash_book/const/database_const.dart';
import 'package:stash_book/database/application_database.dart';
import 'package:stash_book/model/data/dto/account_dto.dart';

abstract class BaseDao {
  // DTOの種類から対象のテーブルを指定する
  String scope(dynamic dto) {
    if (dto is AccountDto) {
      return DatabaseConst.tableAccount;
    } else {
      return "";
    }
  }

  Future<int?> count(dynamic dto) async {
    Database database = await ApplicationDatabase.database;
    int? result = Sqflite.firstIntValue(await database.query(
      scope(dto),
      columns: ['count(*)'],
    ));
    print('${scope(dto)} count [$result]');
    return result;
  }
}
