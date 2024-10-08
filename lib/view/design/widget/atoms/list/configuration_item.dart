import 'package:flutter/material.dart';
import 'package:stash_book/model/form/dto/list_item_array_dto.dart';
import 'package:stash_book/view/design/widget/atoms/button/select_button.dart';
import 'package:stash_book/view/design/wrapper/atoms_widget.dart';

class ConfigurationItemAtoms extends AtomWidget {
  const ConfigurationItemAtoms({
    super.key,
    required this.item,
  });
  final ListItemArrayDto item;

  @override
  Widget buildMaterial(BuildContext context) {
    return ListTile(
      title: item.caption,
      trailing: SizedBox(
        width: item.width,
        child: SelectButtonAtoms(
          item: item,
        ),
      ),
    );
  }
}
