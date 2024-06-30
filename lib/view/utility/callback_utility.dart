import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/const/database_const.dart';
import 'package:stash_book/database/application_database.dart';
import 'package:stash_book/model/data/dao/possession_dao.dart';
import 'package:stash_book/model/data/dao/setting_dao.dart';
import 'package:stash_book/model/data/dto/favorite_dto.dart';
import 'package:stash_book/model/data/dto/setting_dto.dart';
import 'package:stash_book/service/dialog_action_service.dart';
import 'package:stash_book/service/possession_service.dart';

// 戻るコールバック
VoidCallback makeReturnCallback(BuildContext context) {
  return () => Navigator.pop(context, -1);
}

// 確定のコールバック
VoidCallback makeAcceptCallback(BuildContext context) {
  return () => Navigator.pop(context, true);
}

// 入力ダイアログの結果受領コールバック
VoidCallback makeResultCallback(
  BuildContext context,
  TextEditingController controller,
  int type,
) {
  switch (type) {
    case typeNumeric:
      return () => Navigator.pop<int>(
            context,
            int.tryParse(controller.text),
          );
    case typeString:
      return () => Navigator.pop<String>(
            context,
            controller.text,
          );
    default:
      return () {};
  }
}

// マルチ入力ダイアログの結果受領コールバック
VoidCallback makeResultsCallback(
  BuildContext context,
  List<TextEditingController> controllers,
) {
  return () => Navigator.pop<FavoriteDto>(
        context,
        FavoriteDto(
            no: 0,
            category: controllers[0].text,
            remarks: controllers[1].text,
            price: controllers[2].text == stringNull
                ? 0
                : int.parse(controllers[2].text)),
      );
}

// configのindexType別コールバック
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

// 各ボタンのsubmitコールバック
VoidCallback makeButtonCallback(
  BuildContext context,
  List<Object> list,
) {
  ApplicationBloc bloc = Provider.of<ApplicationBloc>(context);
  SettingDao setting = SettingDao();

  switch (list[indexKey]) {
    // Deposit
    case 'A01':
      return () async {
        // 機能呼び出しのみ、画面遷移なし
        await deposit(context, bloc, list);
      };
    // Expense
    case 'A02':
      return () async {
        // 機能呼び出しのみ、画面遷移なし
        await expense(context, bloc, list);
      };
    // Initialize
    case 'C01':
      return () async {
        bool isAllowed = await DialogActionService.notification(
          context,
          list[indexKey].toString(),
          int.parse(list[indexInitial].toString()),
        );

        if (isAllowed) {
          // ローカルDBを削除して初期化
          await ApplicationDatabase.finalize();
          await ApplicationDatabase.database;
          PossessionDao possession = PossessionDao();
          if (!await possession.isAuthorized()) {
            possession.initialize();
          }

          // 所持金を0で更新
          bloc.deposit.add(0);

          // 画面遷移
          Navigator.pop(context);
        }
      };
    case 'C02':
    case 'C03':
      return () async {
        List<SettingDto> settings = await setting.select(
            DatabaseConst.columnKey, list[indexName].toString());

        int result = await DialogActionService.inputIntValue(
          context,
          list[indexKey].toString(),
          settings[0].value,
          int.parse(list[indexInitial].toString()),
        );

        // 入力された金額を設定
        if (result > 0) {}
      };
    case 'C04':
      return () async {
        List<SettingDto> settings = await setting.select(
            DatabaseConst.columnKey, list[indexName].toString());

        String result = await DialogActionService.inputStringValue(
          context,
          list[indexKey].toString(),
          settings[0].value,
          int.parse(list[indexInitial].toString()),
        );

        // 入力された文字列を設定
        if (result != stringError) {}
      };
    default:
      return Void as VoidCallback;
  }
}
