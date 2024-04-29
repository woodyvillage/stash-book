import 'package:flutter/material.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/model/form/dto/config_list_dto.dart';
import 'package:stash_book/view/utility/callback_utility.dart';
import 'package:stash_book/view/utility/contents_utility.dart';

class ConfigListDao {
  ConfigListDto createDto(BuildContext context, List<Object> item) {
    return ConfigListDto(
      callback: makeCallback(context, item),
      caption: getText(context, item[indexKey].toString()),
      command: getDesc(context, item[indexKey].toString()),
      width: 120,
    );
  }
}
