import 'package:stash_book/const/database_const.dart';
import 'package:stash_book/model/data/dao/abstract/base_dao.dart';
import 'package:stash_book/model/data/dto/favorite_dto.dart';

class FavoriteDao extends BaseDao<FavoriteDto> {
  @override
  String scope() => DatabaseConst.tableFavorite;

  @override
  List<FavoriteDto> parseResult(List<Map<String, dynamic>> result) {
    return result.isNotEmpty
        ? result.map((item) => FavoriteDto.parse(item)).toList()
        : [];
  }
}
