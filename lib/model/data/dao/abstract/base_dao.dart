import 'package:sqflite/sqflite.dart';
import 'package:stash_book/database/application_database.dart';

abstract class BaseDao<T> {
  String scope();

  Future<int?> count(dynamic dao) async {
    Database database = await ApplicationDatabase.database;
    return Sqflite.firstIntValue(await database.query(
      scope(),
      columns: ['count(*)'],
    ));
  }

  Future<int> insert(dynamic dao, dynamic dto) async {
    Database database = await ApplicationDatabase.database;
    return await database.insert(
      scope(),
      dto.toMap(),
    );
  }

  Future<int> update(dynamic dao, dynamic dto) async {
    Database database = await ApplicationDatabase.database;
    return await database.update(
      scope(),
      dto.toMap(),
    );
  }

  Future<List<T>> list() async {
    Database database = await ApplicationDatabase.database;
    List<Map<String, dynamic>> result = await database.query(scope());
    return parseResult(result);
  }

  Future<List<T>> sort(String column, String direction) async {
    Database database = await ApplicationDatabase.database;
    List<Map<String, dynamic>> result =
        await database.query(scope(), orderBy: '$column $direction');
    return parseResult(result);
  }

  List<T> parseResult(List<Map<String, dynamic>> result);
}
