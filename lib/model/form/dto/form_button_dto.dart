import 'package:flutter/material.dart';
import 'package:stash_book/model/form/dto/abstract/base_item_dto.dart';

class FormButtonDto extends BaseItemDto {
  Text? caption;
  Color? foreColor;
  Color? backColor;
  IconData? icon;

  FormButtonDto({
    required super.index,
    required super.callback,
    this.caption,
    this.foreColor,
    this.backColor,
    this.icon,
  });
}
