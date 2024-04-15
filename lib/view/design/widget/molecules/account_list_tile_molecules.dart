import 'package:flutter/material.dart';
import 'package:stash_book/model/data/dto/account_dto.dart';
import 'package:stash_book/view/design/widget/atoms/list/account_item.dart';
import 'package:stash_book/view/design/wrapper/molecules_widget.dart';

class AccountListTileMolecules extends MoleculeWidget {
  const AccountListTileMolecules({
    super.key,
    required this.item,
  });
  final AccountDto item;

  @override
  Widget buildMolecule(final BuildContext context) {
    return Card(
      child: AccountItemAtoms(item: item),
    );
  }
}
