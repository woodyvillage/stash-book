import 'package:flutter/material.dart';
import 'package:stash_book/model/data/dto/account_dto.dart';
import 'package:stash_book/view/design/widget/atoms/avatar/circle_avatar.dart';
import 'package:stash_book/view/design/wrapper/atoms_widget.dart';
import 'package:stash_book/view/utility/format_utility.dart';

class AccountItemAtoms extends AtomWidget {
  const AccountItemAtoms({
    super.key,
    required this.item,
  });
  final AccountDto item;

  @override
  Widget buildMaterial(BuildContext context) {
    return ListTile(
      leading: CircleAvatarAtoms(mode: item.mode, price: item.price),
      title: Text(
        item.remarks,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: Text(
        formatDate(context, item.date),
        style: const TextStyle(fontSize: 10),
      ),
    );
  }
}
