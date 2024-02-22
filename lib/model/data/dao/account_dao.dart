import 'package:sqflite/sqflite.dart';
import 'package:stash_book/const/database_const.dart';
import 'package:stash_book/database/application_database.dart';
import 'package:stash_book/model/data/dao/abstract/base_dao.dart';
import 'package:stash_book/model/data/dto/account_dto.dart';

class AccountDao extends BaseDao {
  Future<bool> isAuthorized() async {
    AccountDto dto = AccountDto(inquiry: 0);
    int? result = await count(dto);
    print('isAuthorized => ${result == 0 ? false : true}');

    return result == null
        ? false
        : result == 0
            ? false
            : true;
  }

  Future<int> initialize() async {
    AccountDto dto = AccountDto(inquiry: 12345);
    return await insert(dto);
  }

  Future<AccountDto> select() async {
    Database database = await ApplicationDatabase.database;
    List<Map<String, dynamic>> result =
        await database.query(DatabaseConst.tableAccount);
    List<AccountDto> dto = result.isNotEmpty
        ? result.map((item) => AccountDto.parse(item)).toList()
        : [];
    return dto[0];
  }

  Future<int> update(AccountDto dto) async {
    Database database = await ApplicationDatabase.database;
    return await database.update(
      DatabaseConst.tableAccount,
      dto.toMap(),
    );
  }
}
