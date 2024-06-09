import 'package:stash_book/const/database_const.dart';
import 'package:stash_book/model/data/dao/favorite_dao.dart';

////////////////////////////////////////////////////////////////////
// お気に入り取得
////////////////////////////////////////////////////////////////////
Future getFavorite() async {
  FavoriteDao dao = FavoriteDao();
  return await dao.sort(DatabaseConst.columnNo, DatabaseConst.sortDesc);
}
