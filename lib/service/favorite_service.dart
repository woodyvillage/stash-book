import 'package:flutter/material.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/const/application_const.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/const/database_const.dart';
import 'package:stash_book/model/data/dao/favorite_dao.dart';
import 'package:stash_book/model/data/dto/favorite_dto.dart';
import 'package:stash_book/view/dialog/application_dialog.dart';

////////////////////////////////////////////////////////////////////
// お気に入り取得
////////////////////////////////////////////////////////////////////
Future getFavorite() async {
  FavoriteDao dao = FavoriteDao();
  return await dao.sort(DatabaseConst.columnNo, DatabaseConst.sortDesc);
}

////////////////////////////////////////////////////////////////////
// お気に入り更新
////////////////////////////////////////////////////////////////////
Future setFavorite(FavoriteDto dto) async {
  FavoriteDao dao = FavoriteDao();
  return await dao.insert(dao, dto);
}

////////////////////////////////////////////////////////////////////
// 登録
////////////////////////////////////////////////////////////////////
Future entry(
  BuildContext context,
  ApplicationBloc bloc,
) async {
  // 入力内容
  FavoriteDto favorite;
  try {
    favorite = await applicationDialog(
      context: context,
      title: stringNull,
      value: stringNull,
      initial: typeMultiple,
      items: favoriteLists,
    );
  } catch (e) {
    print("debug0:");
    favorite =
        FavoriteDto(no: 0, category: stringNull, remarks: stringNull, price: 0);
  }

  // お気に入りの更新
  await setFavorite(favorite);

  // 出金の通知
  bloc.expense.add(0);
}
