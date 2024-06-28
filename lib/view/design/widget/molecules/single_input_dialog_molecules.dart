import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/model/form/dto/form_editor_dto.dart';
import 'package:stash_book/view/design/widget/atoms/button/dialog_button.dart';
import 'package:stash_book/view/design/widget/atoms/dialog/simple_dialog.dart';
import 'package:stash_book/view/design/wrapper/molecules_widget.dart';
import 'package:stash_book/view/utility/callback_utility.dart';
import 'package:stash_book/view/utility/contents_utility.dart';

class SingleInputDialogMolecules extends MoleculeWidget {
  const SingleInputDialogMolecules({
    super.key,
    required this.item,
  });
  final FormEditorDto item;

  @override
  Widget buildMolecule(final BuildContext context) {
    return SimpleDialogAtoms(
      title: getText(context, item.title),
      content: TextField(
        controller: item.controller,
        decoration: getHint(context, item.title),
        keyboardType: getKeyType(context, item.title),
        inputFormatters: getFormat(context, item.title),
      ),
      actions: buildMolecules(context, item.type),
    );
  }

  List<Widget> buildMolecules(BuildContext context, int type) {
    List<Widget> containers = [];
    containers.add(DialogButtonAtoms(
      title: AppLocalizations.of(context)!.cancel,
      callback: makeReturnCallback(context),
    ));
    containers.add(DialogButtonAtoms(
      title: AppLocalizations.of(context)!.submit,
      callback: makeResultCallback(context, item.controller, type),
    ));
    return containers;
  }
}
