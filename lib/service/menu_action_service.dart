import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/const/application_const.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/model/data/dto/account_dto.dart';
import 'package:stash_book/model/form/dto/account_list_item_array_dto.dart';
import 'package:stash_book/service/account_service.dart';
import 'package:stash_book/view/dialog/application_dialog.dart';

class MenuActionService {
  static dispatch(
    ApplicationBloc bloc,
    BuildContext context,
    AccountListItemArrayDto item,
    String? value,
  ) async {
    switch (value) {
      case 'modify':
        // ダイアログ入力
        AccountDto account = await applicationDialog<AccountListItemArrayDto>(
          context: context,
          title: contentsActivity,
          value: stringNull,
          initial: typeMultiple,
          items: item,
        );
        updActivity(account);

        // 差額計算
        if (item.dto.price != account.price) {
          int difference = item.dto.price - account.price;

          if (difference > intNothing) {
            // 入金の通知
            bloc.deposit.add(difference);
          } else {
            // 出金の通知
            bloc.withdraw.add(difference * intMinus);
          }
        }

        // 振動
        HapticFeedback.heavyImpact();

        break;
      case 'delete':
        item.dto.deleted = intDeleted;
        updActivity(item.dto);

        if (item.dto.mode == indexDeposit) {
          // 出金の通知
          bloc.withdraw.add(item.dto.price);
        } else {
          // 入金の通知
          bloc.deposit.add(item.dto.price);
        }

        // 振動
        HapticFeedback.heavyImpact();

        break;
      default:
        // 何もしない
        break;
    }
  }
}
