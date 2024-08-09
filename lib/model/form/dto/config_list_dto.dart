import 'package:flutter/material.dart';
import 'package:stash_book/model/form/dto/abstract/base_form_dto.dart';

class ConfigListDto extends BaseFormDto {
  Text caption;
  Text command;
  double? width;

  ConfigListDto({
    required super.callback,
    required this.caption,
    required this.command,
    this.width = 120,
  });
}
