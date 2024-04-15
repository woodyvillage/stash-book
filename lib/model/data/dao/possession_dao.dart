import 'package:sqflite/sqflite.dart';
import 'package:stash_book/const/database_const.dart';
import 'package:stash_book/database/application_database.dart';
import 'package:stash_book/model/data/dao/abstract/base_dao.dart';
import 'package:stash_book/model/data/dto/possession_dto.dart';

class PossessionDao extends BaseDao {
  Future<bool> isAuthorized() async {
    int? result = await count(this);
    print('isAuthorized => ${result == 0 ? false : true}');
    return result == null
        ? false
        : result == 0
            ? false
            : true;
  }

  Future<int> initialize() async {
    PossessionDto dto = PossessionDto(possession: 0);
    return await insert(this, dto);
  }

  Future<List<PossessionDto>> list() async {
    Database database = await ApplicationDatabase.database;
    List<Map<String, dynamic>> result = await database.query(scope(this));
    return result.isNotEmpty
        ? result.map((item) => PossessionDto.parse(item)).toList()
        : [];
  }

  Future<PossessionDto> find() async {
    List<PossessionDto> result = await list();
    return result.isNotEmpty ? result[0] : PossessionDto(possession: 0);
  }
}
