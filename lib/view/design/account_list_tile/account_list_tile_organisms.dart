import 'package:flutter/material.dart';
import 'package:stash_book/model/data/dto/account_dto.dart';
import 'package:stash_book/view/design/widget/molecules/account_list_tile_molecules.dart';

class AccountListTileOrganisms extends StatefulWidget {
  const AccountListTileOrganisms({
    super.key,
    required this.item,
  });
  final AccountDto item;

  @override
  State createState() => _AccountListTileOrganismsState();
}

class _AccountListTileOrganismsState extends State<AccountListTileOrganisms> {
  @override
  Widget build(BuildContext context) {
    return AccountListTileMolecules(item: widget.item);
  }
}
