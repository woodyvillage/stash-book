import 'package:flutter/material.dart';
import 'package:stash_book/const/application_const.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/model/data/dto/favorite_dto.dart';
import 'package:stash_book/model/form/dao/favorite_floater_item_array_dao.dart';
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
    FavoriteFloaterItemArrayDao dao = FavoriteFloaterItemArrayDao();
    FavoriteDto favorite = FavoriteDto(
      no: 0,
      category: stringNull,
      remarks: stringNull,
      price: 0,
      deleted: typeNothing,
    );
    return FavoriteListTileMolecules(
        item: dao.createDto(favoriteLists, favorite));
  }
}
