import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/model/form/dto/account_list_item_array_dto.dart';
import 'package:stash_book/model/form/dto/list_item_array_dto.dart';
import 'package:stash_book/view/design/widget/atoms/list/account_item.dart';
import 'package:stash_book/view/design/wrapper/molecules_widget.dart';

class AccountListTileMolecules extends MoleculeWidget {
  const AccountListTileMolecules({
    super.key,
    required this.item,
  });
  final AccountListItemArrayDto item;

  @override
  Widget buildMolecule(final BuildContext context) {
    return Card(
      child: AccountItemAtoms(item: item, menu: buildMolecules(context, item)),
    );
  }

  List<ListItemArrayDto> buildMolecules(
    BuildContext context,
    AccountListItemArrayDto item,
  ) {
    List<ListItemArrayDto> menu = [];
    menu.add(ListItemArrayDto(
      index: 'modify',
      callback: () => {},
      caption: Text(AppLocalizations.of(context)!.edit),
      icon: Icons.edit,
    ));
    menu.add(ListItemArrayDto(
      index: 'delete',
      callback: () => {},
      caption: Text(AppLocalizations.of(context)!.delete),
      icon: Icons.delete,
    ));
    return menu;
  }
}
