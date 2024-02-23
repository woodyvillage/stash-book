import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/service/account_service.dart';

VoidCallback makeReturnCallback(BuildContext context) {
  return () => Navigator.pop(context, 0);
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
  int index,
  List<List<Object>> list,
) {
  VoidCallback callback;
  switch (list[index][indexType]) {
    case patternButton:
      callback = makeButtonCallback(context, index, list);
      break;
    default:
      callback = Void as VoidCallback;
      break;
  }
  return callback;
}

VoidCallback makeButtonCallback(
  BuildContext context,
  int index,
  List<List<Object>> list,
) {
  switch (list[index][indexKey]) {
    // Deposit
    case 'A01':
      ApplicationBloc bloc = Provider.of<ApplicationBloc>(context);
      return () async {
        // 機能呼び出しのみ、画面遷移なし
        await deposit(context, bloc, list[index]);
      };
    default:
      return Void as VoidCallback;
  }
}
