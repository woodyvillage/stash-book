import 'package:sqflite/sqflite.dart';
import 'package:stash_book/const/database_const.dart';
import 'package:stash_book/database/application_database.dart';
import 'package:stash_book/model/data/dao/abstract/base_dao.dart';
import 'package:stash_book/model/data/dto/inquiry_dto.dart';

class InquiryDao extends BaseDao {
  Future<bool> isAuthorized() async {
    InquiryDto dto = InquiryDto(inquiry: 0);
    int? result = await count(dto);
    print('isAuthorized => ${result == 0 ? false : true}');

    return result == null
        ? false
        : result == 0
            ? false
            : true;
  }

  Future<int> initialize() async {
    InquiryDto dto = InquiryDto(inquiry: 0);
    return await insert(dto);
  }

  Future<InquiryDto> select() async {
    Database database = await ApplicationDatabase.database;
    List<Map<String, dynamic>> result =
        await database.query(DatabaseConst.tableInquiry);
    List<InquiryDto> dto = result.isNotEmpty
        ? result.map((item) => InquiryDto.parse(item)).toList()
        : [];
    return dto[0];
  }
}
