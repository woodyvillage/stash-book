import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/database/application_database.dart';
import 'package:stash_book/model/data/dao/possession_dao.dart';
import 'package:stash_book/service/navigator_position_service.dart';
import 'package:stash_book/view/application_root.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ローカルDB内のアカウントテーブルをチェック
  await ApplicationDatabase.database;
  PossessionDao account = PossessionDao();
  if (!await account.isAuthorized()) {
    account.initialize();
  }

  runApp(MultiProvider(
    providers: [
      Provider<ApplicationBloc>(
        create: (_) => ApplicationBloc(),
      ),
      ChangeNotifierProvider(
        create: (_) => NavigatorPositionService(),
      ),
    ],
    child: const ApplicationRoot(),
  ));
}
