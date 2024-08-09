import 'package:flutter/material.dart';
import 'package:stash_book/model/form/dto/abstract/base_form_dto.dart';

class AccountMenuDto extends BaseFormDto {
  Text caption;
  IconData icon;

  AccountMenuDto({
    required super.index,
    required super.callback,
    required this.caption,
    required this.icon,
  });
}
