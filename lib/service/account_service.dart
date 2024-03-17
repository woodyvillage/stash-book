import 'package:flutter/material.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/model/data/dao/inquiry_dao.dart';
import 'package:stash_book/model/data/dto/inquiry_dto.dart';
import 'package:stash_book/view/dialog/application_dialog.dart';

////////////////////////////////////////////////////////////////////
// 残金
////////////////////////////////////////////////////////////////////
Future getDto() async {
  // ローカルDB内のアカウントテーブルをチェック
  InquiryDao account = InquiryDao();
  InquiryDto dto = await account.select();
  return dto;
}

////////////////////////////////////////////////////////////////////
// 残金
////////////////////////////////////////////////////////////////////
Future setDto(InquiryDto dto) async {
  // ローカルDB内のアカウントテーブルをチェック
  InquiryDao account = InquiryDao();
  await account.update(dto);
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
    InquiryDto dto = await getDto();
    dto.inquiry += result;

    // 残金の更新
    await setDto(dto);

    // 残金の通知
    bloc.deposit.add(dto.inquiry);
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
    InquiryDto dto = await getDto();
    dto.inquiry -= result;

    // 残金の更新
    await setDto(dto);

    // 残金の通知
    bloc.deposit.add(dto.inquiry);
  }
}
