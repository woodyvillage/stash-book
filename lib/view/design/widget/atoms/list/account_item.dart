import 'package:flutter/material.dart';
import 'package:stash_book/model/form/dto/account_list_item_array_dto.dart';
import 'package:stash_book/model/form/dto/list_item_array_dto.dart';
import 'package:stash_book/view/design/widget/atoms/avatar/circle_avatar.dart';
import 'package:stash_book/view/design/widget/atoms/menu/trailing_menu.dart';
import 'package:stash_book/view/design/wrapper/atoms_widget.dart';
import 'package:stash_book/view/utility/format_utility.dart';

class AccountItemAtoms extends AtomWidget {
  const AccountItemAtoms({
    super.key,
    required this.item,
    required this.menu,
  });
  final AccountListItemArrayDto item;
  final List<ListItemArrayDto> menu;

  @override
  Widget buildMaterial(BuildContext context) {
    return ListTile(
      leading: CircleAvatarAtoms(mode: item.dto.mode, price: item.dto.price),
      title: Text(
        item.dto.remarks,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: Text(
        formatDate(context, item.dto.date),
        style: const TextStyle(fontSize: 10),
      ),
      trailing: TrailingMenuAtoms(item: item, menu: menu),
    );
  }
}
