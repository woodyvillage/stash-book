import 'package:flutter/material.dart';
import 'package:stash_book/model/form/dto/list_item_array_dto.dart';
import 'package:stash_book/view/design/wrapper/atoms_widget.dart';

class SelectButtonAtoms extends AtomWidget {
  const SelectButtonAtoms({
    super.key,
    required this.item,
  });
  final ListItemArrayDto item;

  @override
  Widget buildMaterial(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton.icon(
          label: item.command!,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.white,
            minimumSize: const Size(100, 40),
          ),
          onPressed: item.callback,
        ),
      ],
    );
  }
}
