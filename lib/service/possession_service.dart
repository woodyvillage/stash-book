import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/const/application_const.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/model/data/dao/possession_dao.dart';
import 'package:stash_book/model/data/dto/account_dto.dart';
import 'package:stash_book/model/data/dto/possession_dto.dart';
import 'package:stash_book/service/account_service.dart';
import 'package:stash_book/view/dialog/application_dialog.dart';

////////////////////////////////////////////////////////////////////
// 所持金取得
////////////////////////////////////////////////////////////////////
Future getPossession() async {
  PossessionDao dao = PossessionDao();
  return await dao.find();
}

////////////////////////////////////////////////////////////////////
// 所持金登録
////////////////////////////////////////////////////////////////////
Future setPossession(PossessionDto dto) async {
  PossessionDao dao = PossessionDao();
  return await dao.replace(dao, dto);
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
      title: list[indexName].toString(),
      value: stringNull,
      initial: int.parse(list[indexInitial].toString()),
    );
  } catch (e) {
    amount = 0;
  }

  // 入力された入金額を加算
  if (amount > 0) {
    // 入出金の更新
    AccountDto account = AccountDto(
      no: 0,
      date: DateTime.now().toUtc().toString(),
      remarks: AppLocalizations.of(context)!.deposit,
      price: amount,
      menu: intRandom,
      mode: indexDeposit,
      deleted: typeNothing,
    );
    await setActivity(account);

    // 入金の通知
    bloc.deposit.add(amount);
  }
}

////////////////////////////////////////////////////////////////////
// 出金
////////////////////////////////////////////////////////////////////
withdraw(
  BuildContext context,
  ApplicationBloc bloc,
  List<Object> list,
) async {
  // 出金額の入力
  int amount = 0;
  try {
    amount = await applicationDialog(
      context: context,
      title: list[indexName].toString(),
      value: stringNull,
      initial: int.parse(list[indexInitial].toString()),
    );
  } catch (e) {
    amount = 0;
  }

  // 入力された出金額を減算
  if (amount > 0) {
    // 入出金の更新
    AccountDto account = AccountDto(
      no: 0,
      date: DateTime.now().toUtc().toString(),
      remarks: AppLocalizations.of(context)!.withdraw,
      price: amount,
      menu: intRandom,
      mode: indexWithdraw,
      deleted: typeNothing,
    );
    await setActivity(account);

    // 出金の通知
    bloc.withdraw.add(amount);
  }
}
