import 'package:flutter/material.dart';
import 'package:stash_book/model/data/dto/favorite_dto.dart';
import 'package:stash_book/view/design/widget/atoms/list/favorite_item.dart';
import 'package:stash_book/view/design/wrapper/molecules_widget.dart';

class FavoriteListTileMolecules extends MoleculeWidget {
  const FavoriteListTileMolecules({
    super.key,
    required this.item,
  });
  final FavoriteDto item;

  @override
  Widget buildMolecule(final BuildContext context) {
    return Card(
      child: FavoriteItemAtoms(item: item),
    );
  }
}
