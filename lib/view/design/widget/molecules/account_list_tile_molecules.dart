import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/model/data/dto/account_dto.dart';
import 'package:stash_book/model/form/dto/account_menu_dto.dart';
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
      child: AccountItemAtoms(item: item, menus: buildMolecules(context)),
    );
  }

  List<AccountMenuDto> buildMolecules(final BuildContext context) {
    List<AccountMenuDto> menus = [];
    menus.add(AccountMenuDto(
      index: 'modify',
      callback: () => {},
      caption: Text(AppLocalizations.of(context)!.edit),
      icon: Icons.edit,
    ));
    menus.add(AccountMenuDto(
      index: 'delete',
      callback: () => {},
      caption: Text(AppLocalizations.of(context)!.delete),
      icon: Icons.delete,
    ));
    return menus;
  }
}
