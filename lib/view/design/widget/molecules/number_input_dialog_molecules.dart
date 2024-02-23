import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/view/design/widget/atoms/button/dialog_button.dart';
import 'package:stash_book/view/design/wrapper/molecules_widget.dart';
import 'package:stash_book/view/utility/callback_utility.dart';

class NumberInputDialogMolecules extends MoleculeWidget {
  const NumberInputDialogMolecules({
    super.key,
    required this.controller,
    required this.title,
  });
  final TextEditingController controller;
  final String title;

  getText(BuildContext context, String word) {
    switch (word) {
      // Deposit
      case 'DEPOSIT':
        return Text(AppLocalizations.of(context)!.deposit);
      default:
        return const Text('');
    }
  }

  @override
  Widget buildMolecule(final BuildContext context) {
    return AlertDialog(
      title: getText(context, title),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.hint_need_number),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
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
      title: AppLocalizations.of(context)!.ok,
      callback: makeResultCallback(context, controller),
    ));
    return containers;
  }
}
