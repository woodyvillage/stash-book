import 'package:sqflite/sqflite.dart';
import 'package:stash_book/const/database_const.dart';
import 'package:stash_book/database/application_database.dart';
import 'package:stash_book/model/data/dto/account_dto.dart';
import 'package:stash_book/model/data/dto/inquiry_dto.dart';

abstract class BaseDao {
  // DTOの種類から対象のテーブルを指定する
  String scope(dynamic dto) {
    if (dto is InquiryDto) {
      return DatabaseConst.tableInquiry;
    } else if (dto is AccountDto) {
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

  Future<int> update(dynamic dto) async {
    Database database = await ApplicationDatabase.database;
    return await database.update(
      scope(dto),
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
