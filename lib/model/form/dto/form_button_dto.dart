import 'package:flutter/material.dart';
import 'package:stash_book/model/form/dto/abstract/base_form_dto.dart';

class FormButtonDto extends BaseFormDto {
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
