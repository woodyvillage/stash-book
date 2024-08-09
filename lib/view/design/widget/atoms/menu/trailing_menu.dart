import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/model/data/dto/account_dto.dart';
import 'package:stash_book/model/form/dto/account_menu_dto.dart';
import 'package:stash_book/service/menu_action_service.dart';
import 'package:stash_book/view/design/widget/atoms/padding/separator.dart';
import 'package:stash_book/view/design/wrapper/atoms_widget.dart';

class TrailingMenuAtoms extends AtomWidget {
  const TrailingMenuAtoms({
    super.key,
    required this.item,
    required this.menu,
  });
  final AccountDto item;
  final List<AccountMenuDto> menu;

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
          MenuActionService.dispatch(bloc, item, value);
        });
      },
    );
  }

  List<PopupMenuItem<String>> buildMolecules(List<AccountMenuDto> menus) {
    List<PopupMenuItem<String>> menuitem = [];
    for (AccountMenuDto menu in menus) {
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
