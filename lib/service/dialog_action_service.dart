import 'package:flutter/material.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/view/dialog/application_dialog.dart';

class DialogActionService {
  static notification(
    BuildContext context,
    String title,
    int initial,
  ) async {
    bool result;
    try {
      result = await applicationDialog(
        context: context,
        title: title,
        value: stringNull,
        initial: initial,
      );
    } catch (e) {
      result = false;
    }
    return result;
  }

  static inputIntValue(
    BuildContext context,
    String title,
    String value,
    int initial,
  ) async {
    int result;
    try {
      result = await applicationDialog(
        context: context,
        title: title,
        value: value,
        initial: initial,
      );
    } catch (e) {
      result = -1;
    }
    return result;
  }

  static inputStringValue(
    BuildContext context,
    String title,
    String value,
    int initial,
  ) async {
    String result;
    try {
      result = await applicationDialog(
        context: context,
        title: title,
        value: value,
        initial: initial,
      );
    } catch (e) {
      result = stringError;
    }
    return result;
  }
}
