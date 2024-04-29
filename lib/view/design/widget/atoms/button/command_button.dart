import 'package:flutter/material.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/model/form/dto/form_button_dto.dart';
import 'package:stash_book/view/design/wrapper/atoms_widget.dart';

class CommandButtonAtoms extends AtomWidget {
  const CommandButtonAtoms({
    super.key,
    required this.item,
  });
  final FormButtonDto item;

  @override
  Widget buildMaterial(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(item.icon),
      label: item.caption ?? const Text(stringNull),
      style: ElevatedButton.styleFrom(
        foregroundColor: item.foreColor,
        backgroundColor: item.backColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: item.callback,
    );
  }
}
