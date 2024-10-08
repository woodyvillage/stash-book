import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/const/application_const.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/const/database_const.dart';
import 'package:stash_book/model/data/dao/favorite_dao.dart';
import 'package:stash_book/model/data/dto/account_dto.dart';
import 'package:stash_book/model/data/dto/favorite_dto.dart';
import 'package:stash_book/model/form/dao/favorite_floater_item_array_dao.dart';
import 'package:stash_book/model/form/dto/favorite_floater_item_array_dto.dart';
import 'package:stash_book/service/account_service.dart';
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
  // 画面情報構成
  FavoriteFloaterItemArrayDao dao = FavoriteFloaterItemArrayDao();
  FavoriteDto favorite = FavoriteDto(
    no: 0,
    category: stringNull,
    remarks: stringNull,
    price: 0,
    deleted: typeNothing,
  );

  // ダイアログ入力
  favorite = await applicationDialog<FavoriteFloaterItemArrayDto>(
    context: context,
    title: contentsFavorite,
    value: stringNull,
    initial: typeMultiple,
    items: dao.createDto(favoriteLists, favorite),
  );

  if (favorite.price > 0) {
    // お気に入りの更新
    await setFavorite(favorite);

    // 出金の通知
    bloc.withdraw.add(0);
  }
}

////////////////////////////////////////////////////////////////////
// 定型支払
////////////////////////////////////////////////////////////////////
void expense(
  BuildContext context,
  ApplicationBloc bloc,
  FavoriteDto item,
) async {
  // 入出金の更新
  AccountDto account = AccountDto(
    no: 0,
    date: DateTime.now().toUtc().toString(),
    remarks: "${item.category}(${item.remarks})",
    price: item.price,
    menu: item.no,
    mode: indexWithdraw,
    deleted: typeNothing,
  );
  await setActivity(account);

  // 出金の通知
  bloc.withdraw.add(item.price);

  // 振動
  HapticFeedback.heavyImpact();
}
