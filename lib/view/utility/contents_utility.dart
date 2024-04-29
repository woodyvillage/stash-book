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
      return Text(AppLocalizations.of(context)!.account_maximum);
    case 'C03':
      return Text(AppLocalizations.of(context)!.account_minimum);
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
      return [FilteringTextInputFormatter.digitsOnly];
    default:
      return [FilteringTextInputFormatter.singleLineFormatter];
  }
}
