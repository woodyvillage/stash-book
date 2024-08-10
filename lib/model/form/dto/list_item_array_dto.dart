import 'package:flutter/material.dart';
import 'package:stash_book/model/form/dto/abstract/base_item_dto.dart';

class ListItemArrayDto extends BaseItemDto {
  Text caption;
  Text command;
  double? width;

  ListItemArrayDto({
    required super.callback,
    required this.caption,
    required this.command,
    this.width = 120,
  });
}