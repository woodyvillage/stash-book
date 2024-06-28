import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/view/design/widget/atoms/button/dialog_button.dart';
import 'package:stash_book/view/design/widget/atoms/dialog/simple_dialog.dart';
import 'package:stash_book/view/design/wrapper/molecules_widget.dart';
import 'package:stash_book/view/utility/callback_utility.dart';
import 'package:stash_book/view/utility/contents_utility.dart';

class SingleInputDialogMolecules extends MoleculeWidget {
  const SingleInputDialogMolecules({
    super.key,
    required this.title,
    required this.value,
    required this.type,
  });
  final String title;
  final String value;
  final int type;

  @override
  Widget buildMolecule(final BuildContext context) {
    TextEditingController controller = value == stringNull
        ? TextEditingController()
        : TextEditingController(text: value);
    return SimpleDialogAtoms(
      title: getText(context, title),
      content: TextField(
        controller: controller,
        decoration: getHint(context, title),
        keyboardType: getKeyType(context, title),
        inputFormatters: getFormat(context, title),
      ),
      actions: buildMolecules(context, controller, type),
    );
  }

  List<Widget> buildMolecules(
      BuildContext context, TextEditingController controller, int type) {
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
