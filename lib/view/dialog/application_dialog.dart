import 'package:flutter/material.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/view/design/confirm_dialog/confirm_dialog_organisms.dart';
import 'package:stash_book/view/design/multi_input_dialog/multi_input_dialog_organisms.dart';
import 'package:stash_book/view/design/single_input_dialog/single_input_dialog_organisms.dart';

// ダイアログ表示
Future applicationDialog({
  required BuildContext context,
  required String title,
  required String value,
  required int initial,
  List<List<Object>>? items,
}) {
  return showDialog(
    context: context,
    useRootNavigator: true,
    builder: (BuildContext context) {
      return dialogBuilder(title, value, items, initial);
    },
  );
}

Widget dialogBuilder(
  String title,
  String value,
  List<List<Object>>? items,
  int initial,
) {
  Widget dialog;

  // 初期値の値からダイアログのタイプを決定
  if (initial == typeNothing) {
    // 入力なし
    dialog = ConfirmDialogOrganisms(title: title.toString());
  } else if (initial == typeMultiple) {
    // マルチ入力
    dialog = MultiInputDialogOrganisms(
      items: items!,
    );
  } else {
    // シングル入力
    dialog = SingleInputDialogOrganisms(
      title: title,
      value: value,
      type: initial,
    );
  }
  return dialog;
}
