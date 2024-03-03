import 'package:flutter/material.dart';
import 'package:stash_book/const/application_const.dart';
import 'package:stash_book/model/form/dto/form_button_dto.dart';

List<FormButtonDto> implementCommandButton(BuildContext context) {
  List<FormButtonDto> items = [];

  // Submitボタン
  items.add(FormButtonDto(
    index: functionSubmit,
    callback: () {
      Navigator.pop(context);
    },
  ));

  // Cancelボタン
  items.add(FormButtonDto(
    index: functionCancel,
    callback: () {
      Navigator.pop(context);
    },
  ));

  return items;
}
