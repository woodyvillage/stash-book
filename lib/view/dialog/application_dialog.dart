import 'package:flutter/material.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/view/design/confirm_dialog/confirm_dialog_organisms.dart';
import 'package:stash_book/view/design/number_input_dialog/number_input_dialog_organisms.dart';

// ダイアログ表示
Future applicationDialog({
  required BuildContext context,
  required Object title,
  required Object initial,
}) {
  return showDialog(
    context: context,
    useRootNavigator: true,
    builder: (BuildContext context) {
      return dialogBuilder(title, initial);
    },
  );
}

Widget dialogBuilder(Object title, Object initial) {
  Widget dialog;

  // 初期値の値からダイアログのタイプを決定
  if (int.parse(initial.toString()) == typeNumeric) {
    dialog = NumberInputDialogOrganisms(title: title.toString());
    // } else if (initial is String) {
    //   // null：初期表示なし
    //   dialog = TextDialog(title: title, value: value);
    // }
  } else {
    dialog = ConfirmDialogOrganisms(title: title.toString());
  }
  return dialog;
}
