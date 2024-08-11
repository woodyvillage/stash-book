import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/model/form/dto/account_list_item_array_dto.dart';
import 'package:stash_book/model/form/dto/list_item_array_dto.dart';
import 'package:stash_book/service/menu_action_service.dart';
import 'package:stash_book/view/design/widget/atoms/padding/separator.dart';
import 'package:stash_book/view/design/wrapper/atoms_widget.dart';

class TrailingMenuAtoms extends AtomWidget {
  const TrailingMenuAtoms({
    super.key,
    required this.item,
    required this.menu,
  });
  final AccountListItemArrayDto item;
  final List<ListItemArrayDto> menu;

  @override
  Widget buildMaterial(BuildContext context) {
    ApplicationBloc bloc = Provider.of<ApplicationBloc>(context);
    return GestureDetector(
      child: const Icon(Icons.more_vert),
      onTapDown: (details) {
        final position = details.globalPosition;
        showMenu<String>(
          context: context,
          position: RelativeRect.fromLTRB(position.dx, position.dy, 0, 0),
          items: buildMolecules(menu),
        ).then((value) {
          MenuActionService.dispatch(bloc, context, item, value);
        });
      },
    );
  }

  List<PopupMenuItem<String>> buildMolecules(List<ListItemArrayDto> menus) {
    List<PopupMenuItem<String>> menuitem = [];
    for (ListItemArrayDto menu in menus) {
      menuitem.add(
        PopupMenuItem<String>(
          value: menu.index,
          child: Row(
            children: [
              Icon(menu.icon),
              const SeparatorAtoms(width: 5),
              menu.caption,
            ],
          ),
        ),
      );
    }

    return menuitem;
  }
}
