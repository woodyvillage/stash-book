import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/database/application_database.dart';
import 'package:stash_book/model/data/dao/account_dao.dart';
import 'package:stash_book/service/account_service.dart';
import 'package:stash_book/view/dialog/application_dialog.dart';

VoidCallback makeReturnCallback(BuildContext context) {
  return () => Navigator.pop(context, 0);
}

VoidCallback makeAcceptCallback(BuildContext context) {
  return () => Navigator.pop(context, true);
}

VoidCallback makeResultCallback(
  BuildContext context,
  TextEditingController controller,
) {
  return () => Navigator.pop<int>(
        context,
        int.tryParse(controller.text),
      );
}

VoidCallback makeCallback(
  BuildContext context,
  List<Object> list,
) {
  VoidCallback callback;
  switch (list[indexType]) {
    case patternButton:
      callback = makeButtonCallback(context, list);
      break;
    default:
      callback = Void as VoidCallback;
      break;
  }
  return callback;
}

VoidCallback makeButtonCallback(
  BuildContext context,
  List<Object> list,
) {
  switch (list[indexKey]) {
    // Deposit
    case 'A01':
      ApplicationBloc bloc = Provider.of<ApplicationBloc>(context);
      return () async {
        // 機能呼び出しのみ、画面遷移なし
        await deposit(context, bloc, list);
      };
    // Initialize
    case 'C01':
      return () async {
        bool isAllowed = false;
        try {
          isAllowed = await applicationDialog(
            context: context,
            title: list[indexKey],
            initial: list[indexInitial],
          );
        } catch (e) {
          isAllowed = false;
        }

        if (isAllowed) {
          // ローカルDBを削除して初期化
          await ApplicationDatabase.finalize();
          await ApplicationDatabase.database;
          AccountDao account = AccountDao();
          if (!await account.isAuthorized()) {
            account.initialize();
          }

          // 画面遷移
          Navigator.pop(context);
        }
      };
    default:
      return Void as VoidCallback;
  }
}
