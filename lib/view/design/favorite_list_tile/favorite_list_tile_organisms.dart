import 'package:flutter/material.dart';
import 'package:stash_book/model/data/dto/favorite_dto.dart';
import 'package:stash_book/view/design/widget/molecules/favorite_list_tile_molecules.dart';

class FavoriteListTileOrganisms extends StatefulWidget {
  const FavoriteListTileOrganisms({
    super.key,
    required this.item,
  });
  final FavoriteDto item;

  @override
  State createState() => _FavoriteListTileOrganismsState();
}

class _FavoriteListTileOrganismsState extends State<FavoriteListTileOrganisms> {
  @override
  Widget build(BuildContext context) {
    return FavoriteListTileMolecules(item: widget.item);
  }
}
