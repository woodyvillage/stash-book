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
  PossessionDao dao = PossessionDao();
  return await dao.select();
}

////////////////////////////////////////////////////////////////////
// 所持金更新
////////////////////////////////////////////////////////////////////
Future setPossession(PossessionDto dto) async {
  PossessionDao dao = PossessionDao();
  return await dao.update(dao, dto);
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
  int amount = 0;
  try {
    amount = await applicationDialog(
      context: context,
      title: list[indexName],
      initial: list[indexInitial],
    );
  } catch (e) {
    amount = 0;
  }

  // 入力された入金額を加算
  if (amount != 0) {
    // 入金の通知
    bloc.deposit.add(amount);
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
  int amount = 0;
  try {
    amount = await applicationDialog(
      context: context,
      title: list[indexName],
      initial: list[indexInitial],
    );
  } catch (e) {
    amount = 0;
  }

  // 入力された出金額を減算
  if (amount != 0) {
    // 出金の通知
    bloc.expense.add(amount);
  }
}
