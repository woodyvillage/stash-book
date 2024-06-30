import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/const/application_const.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/const/configuration_const.dart';
import 'package:stash_book/const/database_const.dart';
import 'package:stash_book/model/data/dao/account_dao.dart';
import 'package:stash_book/model/data/dao/setting_dao.dart';
import 'package:stash_book/model/data/dto/account_dto.dart';
import 'package:stash_book/model/data/dto/setting_dto.dart';

////////////////////////////////////////////////////////////////////
// 入出金取得
////////////////////////////////////////////////////////////////////
Future getActivity() async {
  AccountDao dao = AccountDao();
  return await dao.sort(DatabaseConst.columnNo, DatabaseConst.sortDesc);
}

////////////////////////////////////////////////////////////////////
// 入出金更新
////////////////////////////////////////////////////////////////////
Future setActivity(AccountDto dto) async {
  AccountDao dao = AccountDao();
  return await dao.insert(dao, dto);
}

////////////////////////////////////////////////////////////////////
// 入出金算定
////////////////////////////////////////////////////////////////////
int getPayment(int min, int max) {
  var fractionalFormat = DateFormat('S', 'ja_JP');
  var seed = fractionalFormat.format(DateTime.now());

  int next = min + (Random(int.parse(seed)).nextInt(max - min));
  return (next / 10).floor() * 10;
}

////////////////////////////////////////////////////////////////////
// 支払
////////////////////////////////////////////////////////////////////
payment(ApplicationBloc bloc) async {
  SettingDao setting = SettingDao();
  List<SettingDto> settings = await setting.list();

  // 下限と上限、摘要
  int? min = 0;
  int? max = 0;
  String remarks = stringNull;
  for (var record in settings) {
    if (record.key == settingsMinimum) {
      min = int.tryParse(record.value);
    } else if (record.key == settingsMaximum) {
      max = int.tryParse(record.value);
    } else if (record.key == settingsRemarks) {
      remarks = record.value;
    }
  }

  // 支払額確定
  int amount = getPayment(min!, max!);
  if (kDebugMode) {
    print('payment:$min<$max:$amount');
  }

  // 入出金の更新
  AccountDto account = AccountDto(
    no: 0,
    date: DateTime.now().toUtc().toString(),
    remarks: remarks,
    price: amount,
    mode: indexWithdraw,
  );
  await setActivity(account);

  // 出金の通知
  bloc.withdraw.add(amount);
}
