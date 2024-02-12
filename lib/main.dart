import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stash_book/database/application_database.dart';
import 'package:stash_book/model/data/dao/account_dao.dart';
import 'package:stash_book/service/navigator_position_service.dart';
import 'package:stash_book/view/application_root.dart';

Future<void> main() async {
  // ローカルDB内のアカウントテーブルをチェック
  await ApplicationDatabase.database;
  AccountDao account = AccountDao();
  await account.isAuthorized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => NavigatorPositionService(),
      ),
    ],
    child: const ApplicationRoot(),
  ));
}
