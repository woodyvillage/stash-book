import 'package:flutter/material.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/model/data/dao/possession_dao.dart';
import 'package:stash_book/model/data/dto/possession_dto.dart';
import 'package:stash_book/view/dialog/application_dialog.dart';

////////////////////////////////////////////////////////////////////
// 所持金取得
////////////////////////////////////////////////////////////////////
Future getPossession() async {
  // 所持金テーブルをチェック
  PossessionDao dao = PossessionDao();
  PossessionDto dto = await dao.select();
  return dto;
}

////////////////////////////////////////////////////////////////////
// 所持金更新
////////////////////////////////////////////////////////////////////
Future setPossession(PossessionDto dto) async {
  // ローカルDB内のアカウントテーブルをチェック
  PossessionDao dao = PossessionDao();
  await dao.update(dto);
}

////////////////////////////////////////////////////////////////////
// 入金
////////////////////////////////////////////////////////////////////
deposit(
  BuildContext context,
  ApplicationBloc bloc,
  List<Object> list,
) async {
  // 入金額の入力
  int result = 0;
  try {
    result = await applicationDialog(
      context: context,
      title: list[indexName],
      initial: list[indexInitial],
    );
  } catch (e) {
    result = 0;
  }

  // 入力された入金額を加算
  if (result != 0) {
    // 所持金の取得
    PossessionDto dto = await getPossession();
    dto.possession += result;

    // 所持金の更新
    await setPossession(dto);

    // 所持金の通知
    bloc.deposit.add(dto.possession);
  }
}

////////////////////////////////////////////////////////////////////
// 出金
////////////////////////////////////////////////////////////////////
expense(
  BuildContext context,
  ApplicationBloc bloc,
  List<Object> list,
) async {
  // 出金額の入力
  int result = 0;
  try {
    result = await applicationDialog(
      context: context,
      title: list[indexName],
      initial: list[indexInitial],
    );
  } catch (e) {
    result = 0;
  }

  // 入力された出金額を減算
  if (result != 0) {
    // 所持金の取得
    PossessionDto dto = await getPossession();
    dto.possession -= result;

    // 所持金の更新
    await setPossession(dto);

    // 所持金の通知
    bloc.deposit.add(dto.possession);
  }
}
