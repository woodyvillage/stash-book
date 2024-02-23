import 'package:flutter/material.dart';
import 'package:stash_book/const/application_const.dart';
import 'package:stash_book/view/design/confirm_dialog/confirm_dialog_organisms.dart';
import 'package:stash_book/view/design/number_input_dialog/number_input_dialog_organisms.dart';

// 入力ダイアログ表示
Future showSingleDialog({
  required BuildContext context,
  required Object title,
  required Object initial,
}) {
  Widget dialog;

  // 初期値の値からダイアログのタイプを決定
  if (int.parse(initial.toString()) == typeNumeric) {
    dialog = NumberInputDialogOrganisms(title: title.toString());
    // } else if (initial is String) {
    //   // null：初期表示なし
    //   dialog = TextDialog(title: title, value: value);
    // }
  } else {
    dialog = NumberInputDialogOrganisms(title: title.toString());
  }

  return showDialog(
    context: context,
    useRootNavigator: true,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}
