import 'package:sqflite/sqflite.dart';
import 'package:stash_book/const/database_const.dart';
import 'package:stash_book/database/application_database.dart';
import 'package:stash_book/model/data/dao/abstract/base_dao.dart';
import 'package:stash_book/model/data/dto/account_dto.dart';

class AccountDao extends BaseDao {
  Future<List<AccountDto>> select() async {
    Database database = await ApplicationDatabase.database;
    List<Map<String, dynamic>> result =
        await database.query(DatabaseConst.tableAccount);
    List<AccountDto> dto = result.isNotEmpty
        ? result.map((item) => AccountDto.parse(item)).toList()
        : [];
    return dto;
  }
}
