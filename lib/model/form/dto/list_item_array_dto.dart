import 'package:flutter/material.dart';
import 'package:stash_book/model/form/dto/abstract/base_item_dto.dart';

class ListItemArrayDto extends BaseItemDto {
  Text caption;
  Text? command;
  double? width;
  IconData? icon;

  ListItemArrayDto({
    super.index,
    required super.callback,
    required this.caption,
    this.command,
    this.icon,
    this.width = 120,
  });
}
