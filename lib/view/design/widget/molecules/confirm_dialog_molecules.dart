import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/view/design/widget/atoms/button/dialog_button.dart';
import 'package:stash_book/view/design/widget/atoms/dialog/simple_dialog.dart';
import 'package:stash_book/view/design/wrapper/molecules_widget.dart';
import 'package:stash_book/view/utility/callback_utility.dart';
import 'package:stash_book/view/utility/contents_utility.dart';

class ConfirmDialogMolecules extends MoleculeWidget {
  const ConfirmDialogMolecules({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget buildMolecule(final BuildContext context) {
    return SimpleDialogAtoms(
      title: getText(context, title),
      actions: buildMolecules(context),
    );
  }

  List<Widget> buildMolecules(final BuildContext context) {
    List<Widget> containers = [];
    containers.add(DialogButtonAtoms(
      title: AppLocalizations.of(context)!.cancel,
      callback: makeReturnCallback(context),
    ));
    containers.add(DialogButtonAtoms(
      title: AppLocalizations.of(context)!.submit,
      callback: makeAcceptCallback(context),
    ));
    return containers;
  }
}
