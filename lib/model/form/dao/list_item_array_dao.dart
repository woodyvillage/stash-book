import 'package:flutter/material.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/model/form/dto/list_item_array_dto.dart';
import 'package:stash_book/view/utility/callback_utility.dart';
import 'package:stash_book/view/utility/contents_utility.dart';

class ListItemArrayDao {
  ListItemArrayDto createDto(
    BuildContext context,
    List<Object> item,
  ) {
    return ListItemArrayDto(
      callback: makeCallback(context, item),
      caption: getText(context, item[indexKey].toString()),
      command: getDesc(context, item[indexKey].toString()),
    );
  }
}
