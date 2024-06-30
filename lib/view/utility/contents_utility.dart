import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/const/common_const.dart';

Text getText(BuildContext context, String word) {
  switch (word) {
    case 'DEPOSIT':
      return Text(AppLocalizations.of(context)!.deposit);
    case 'EXPENSE':
      return Text(AppLocalizations.of(context)!.expense);
    case 'C01':
      return Text(AppLocalizations.of(context)!.db_initialize);
    case 'C02':
      return Text(AppLocalizations.of(context)!.account_minimum);
    case 'C03':
      return Text(AppLocalizations.of(context)!.account_maximum);
    case 'C04':
      return Text(AppLocalizations.of(context)!.account_remarks);
    default:
      return const Text(stringNull);
  }
}

Text getDesc(BuildContext context, String word) {
  switch (word) {
    case 'C01':
      return Text(AppLocalizations.of(context)!.init);
    case 'C02':
    case 'C03':
    case 'C04':
      return Text(AppLocalizations.of(context)!.edit);
    default:
      return const Text(stringNull);
  }
}

InputDecoration getHint(BuildContext context, String word) {
  switch (word) {
    case 'DEPOSIT':
    case 'EXPENSE':
    case 'C02':
    case 'C03':
      return InputDecoration(
          hintText: AppLocalizations.of(context)!.hint_need_number);
    case 'C04':
      return InputDecoration(
          hintText: AppLocalizations.of(context)!.hint_need_string);
    case 'F01':
      return InputDecoration(
          hintText: AppLocalizations.of(context)!.hint_need_category);
    case 'F02':
      return InputDecoration(
          hintText: AppLocalizations.of(context)!.hint_need_remarks);
    case 'F03':
      return InputDecoration(
          hintText: AppLocalizations.of(context)!.hint_need_price);
    default:
      return const InputDecoration(hintText: stringNull);
  }
}

TextInputType getKeyType(BuildContext context, String word) {
  switch (word) {
    case 'DEPOSIT':
    case 'EXPENSE':
    case 'C02':
    case 'C03':
    case 'F03':
      return TextInputType.number;
    default:
      return TextInputType.text;
  }
}

List<TextInputFormatter> getFormat(BuildContext context, String word) {
  switch (word) {
    case 'DEPOSIT':
    case 'EXPENSE':
    case 'C02':
    case 'C03':
    case 'F03':
      return [FilteringTextInputFormatter.digitsOnly];
    default:
      return [FilteringTextInputFormatter.singleLineFormatter];
  }
}

Color getForegroundColor(int mode) {
  switch (mode) {
    // 入金
    case 0:
      return Colors.white;
    // 出金
    case 1:
      return Colors.blue;
    // お気に入り
    default:
      return Colors.green;
  }
}

Color getBackgroundColor(int mode) {
  switch (mode) {
    // 入金
    case 0:
      return Colors.blue;
    // 出金
    case 1:
      return Colors.white;
    // お気に入り
    default:
      return Colors.white;
  }
}

Color getPageBackgroundColor(int mode) {
  switch (mode) {
    // 入金
    case 0:
    // 出金
    case 1:
      return Colors.blue;
    // お気に入り
    default:
      return Colors.green;
  }
}
