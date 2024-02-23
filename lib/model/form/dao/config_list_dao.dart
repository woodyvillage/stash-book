import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/model/form/dto/config_list_dto.dart';
import 'package:stash_book/view/utility/callback_utility.dart';

class ConfigListDao {
  ConfigListDto createDto(BuildContext context, List<Object> item) {
    return ConfigListDto(
      callback: makeCallback(context, item),
      caption: Text(AppLocalizations.of(context)!
          .configure_general_head(item[indexKey].toString())),
      command: Text(AppLocalizations.of(context)!
          .configure_general_desc(item[indexKey].toString())),
      width: 120,
    );
  }
}
