import 'dart:math';

import 'package:intl/intl.dart';
import 'package:stash_book/bloc/application_bloc.dart';
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
  // 入出金テーブルをチェック
  AccountDao dao = AccountDao();
  List<AccountDto> dto = await dao.selectOrderDesc(DatabaseConst.columnNo);
  return dto;
}

////////////////////////////////////////////////////////////////////
// 入出金設定
////////////////////////////////////////////////////////////////////
Future setActivity(AccountDto dto) async {
  AccountDao dao = AccountDao();
  await dao.insert(dto);
  List<AccountDto> accounts = await dao.select();
  for (int i = 0; i < accounts.length; i++) {
    print(
        'select:[$i]date=${accounts[i].date},remarks=${accounts[i].remarks},price=${accounts[i].price}');
  }
}

////////////////////////////////////////////////////////////////////
// 出金
////////////////////////////////////////////////////////////////////
expense(ApplicationBloc bloc) async {
  SettingDao setting = SettingDao();
  List<SettingDto> settings = await setting.select();

  // 下限金額と上限金額
  int? min = 0;
  int? max = 0;
  for (var record in settings) {
    if (record.key == settingsMinimum) {
      min = int.tryParse(record.value);
    } else if (record.key == settingsMaximum) {
      max = int.tryParse(record.value);
    }
  }

  // 支払額確定
  int amount = getPayment(min!, max!);
  print('payment:$min<$max:$amount');

  // 入出金の更新
  AccountDto account = AccountDto(
    no: 0,
    date: DateTime.now().toUtc().toString(),
    remarks: "aaa",
    price: amount,
  );
  await setActivity(account);

  // 出金の通知
  bloc.expense.add(amount);
}

int getPayment(int min, int max) {
  var fractionalFormat = DateFormat('S', 'ja_JP');
  var seed = fractionalFormat.format(DateTime.now());

  int next = min + (Random(int.parse(seed)).nextInt(max - min));
  return (next / 10).floor() * 10;
}
