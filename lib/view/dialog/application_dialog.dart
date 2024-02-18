// 入力ダイアログ表示
import 'package:flutter/material.dart';
import 'package:stash_book/view/design/number_input_dialog/number_input_dialog_organisms.dart';

Future showSingleDialog({
  required BuildContext context,
  required String title,
}) {
  Widget dialog;

  // 初期値の値からダイアログのタイプを決定
  // if (initial is int) {
  // null：初期表示なし
  dialog = NumberInputDialogOrganisms(title: title);
  // } else if (initial is String) {
  //   // null：初期表示なし
  //   dialog = TextDialog(title: title, value: value);
  // }

  return showDialog(
    context: context,
    useRootNavigator: true,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}
