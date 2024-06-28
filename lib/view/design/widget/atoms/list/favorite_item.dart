import 'package:flutter/material.dart';
import 'package:stash_book/model/data/dto/favorite_dto.dart';
import 'package:stash_book/view/design/widget/atoms/avatar/circle_avatar.dart';
import 'package:stash_book/view/design/wrapper/atoms_widget.dart';

class FavoriteItemAtoms extends AtomWidget {
  const FavoriteItemAtoms({
    super.key,
    required this.item,
  });
  final FavoriteDto item;

  @override
  Widget buildMaterial(BuildContext context) {
    return ListTile(
      leading: CircleAvatarAtoms(mode: 9, price: item.price),
      title: Text(
        item.category,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: Text(
        item.remarks,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
