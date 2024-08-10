import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/model/form/dto/favorite_floater_item_array_dto.dart';
import 'package:stash_book/service/favorite_service.dart';
import 'package:stash_book/view/design/widget/atoms/avatar/circle_avatar.dart';
import 'package:stash_book/view/design/wrapper/atoms_widget.dart';

class FavoriteItemAtoms extends AtomWidget {
  const FavoriteItemAtoms({
    super.key,
    required this.item,
  });
  final FavoriteFloaterItemArrayDto item;

  @override
  Widget buildMaterial(BuildContext context) {
    ApplicationBloc bloc = Provider.of<ApplicationBloc>(context);
    return ListTile(
      leading: CircleAvatarAtoms(mode: 9, price: item.dto.price),
      title: Text(
        item.dto.category,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: Text(
        item.dto.remarks,
        style: const TextStyle(fontSize: 16),
      ),
      onLongPress: () => expense(context, bloc, item.dto),
    );
  }
}
