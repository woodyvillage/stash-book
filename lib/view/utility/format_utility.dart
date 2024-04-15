// import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String formatCurrency(
  BuildContext context,
  int? amount,
) {
  amount = amount ?? 0;
  final formatter = NumberFormat(
      AppLocalizations.of(context)?.amount_format);
  return formatter.format(amount);
}

String formatDate(
  BuildContext context,
  String date,
) {
  var formatter = DateFormat(
      AppLocalizations.of(context)?.datetime_format, "ja_JP");
  return formatter.format(DateTime.parse(date).toLocal());
}
