import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/view/design/widget/atoms/button/dialog_button.dart';
import 'package:stash_book/view/design/widget/atoms/dialog/simple_dialog.dart';
import 'package:stash_book/view/design/wrapper/molecules_widget.dart';
import 'package:stash_book/view/utility/callback_utility.dart';
import 'package:stash_book/view/utility/contents_utility.dart';

class NumberInputDialogMolecules extends MoleculeWidget {
  const NumberInputDialogMolecules({
    super.key,
    required this.controller,
    required this.title,
    required this.type,
  });
  final TextEditingController controller;
  final String title;
  final int type;

  @override
  Widget buildMolecule(final BuildContext context) {
    return SimpleDialogAtoms(
      title: getText(context, title),
      content: TextField(
        controller: controller,
        decoration: getHint(context, title),
        keyboardType: getKeyType(context, title),
        inputFormatters: getFormat(context, title),
      ),
      actions: buildMolecules(context, type),
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
      callback: makeResultCallback(context, controller, type),
    ));
    return containers;
  }
}
