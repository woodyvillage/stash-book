import 'package:flutter/material.dart';
import 'package:stash_book/model/form/dto/config_list_dto.dart';
import 'package:stash_book/view/design/widget/atoms/list/configuration_item.dart';
import 'package:stash_book/view/design/wrapper/molecules_widget.dart';

class ConfigurationItemMolecules extends MoleculeWidget {
  const ConfigurationItemMolecules({
    super.key,
    required this.item,
  });
  final ConfigListDto item;

  @override
  Widget buildMolecule(final BuildContext context) {
    return ConfigurationItemAtoms(
      item: item,
    );
  }
}
