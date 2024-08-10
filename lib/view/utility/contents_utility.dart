import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/model/data/dto/favorite_dto.dart';

Text getText(BuildContext context, String word) {
  switch (word) {
    case 'DEPOSIT':
      return Text(AppLocalizations.of(context)!.deposit);
    case 'WITHDRAW':
      return Text(AppLocalizations.of(context)!.withdraw);
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

TextEditingController getDefault<T extends FavoriteDto>(
  TextEditingController controller,
  String column,
  T value,
) {
  switch (column) {
    case 'F22':
      controller.text = value.remarks.toString();
      return controller;
    case 'F23':
      controller.text = value.price == 0 ? stringNull : value.price.toString();
      return controller;
    default:
      return controller;
  }
}

InputDecoration getHint(BuildContext context, String word) {
  switch (word) {
    case 'DEPOSIT':
    case 'WITHDRAW':
    case 'C02':
    case 'C03':
      return InputDecoration(
          hintText: AppLocalizations.of(context)!.hint_need_number);
    case 'C04':
      return InputDecoration(
          hintText: AppLocalizations.of(context)!.hint_need_string);
    case 'F21':
      return InputDecoration(
          hintText: AppLocalizations.of(context)!.hint_need_category);
    case 'F12':
    case 'F22':
      return InputDecoration(
          hintText: AppLocalizations.of(context)!.hint_need_remarks);
    case 'F13':
    case 'F23':
      return InputDecoration(
          hintText: AppLocalizations.of(context)!.hint_need_price);
    default:
      return const InputDecoration(hintText: stringNull);
  }
}

TextInputType getKeyType(BuildContext context, String word) {
  switch (word) {
    case 'DEPOSIT':
    case 'WITHDRAW':
    case 'C02':
    case 'C03':
    case 'F13':
    case 'F23':
      return TextInputType.number;
    default:
      return TextInputType.text;
  }
}

List<TextInputFormatter> getFormat(BuildContext context, String word) {
  switch (word) {
    case 'DEPOSIT':
    case 'WITHDRAW':
    case 'C02':
    case 'C03':
    case 'F13':
    case 'F23':
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
