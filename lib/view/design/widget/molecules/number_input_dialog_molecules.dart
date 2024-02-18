import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/view/design/widget/atoms/button/dialog_button.dart';
import 'package:stash_book/view/design/wrapper/molecules_widget.dart';

class NumberInputDialogMolecules extends MoleculeWidget {
  const NumberInputDialogMolecules({
    super.key,
    required this.controller,
    required this.title,
  });
  final TextEditingController controller;
  final String title;

  @override
  Widget buildMolecule(final BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: '数字で入力してください'),
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
      callback: () => Navigator.pop(context),
    ));
    containers.add(DialogButtonAtoms(
      title: AppLocalizations.of(context)!.ok,
      callback: () =>
          Navigator.pop<int>(context, int.tryParse(controller.text)),
    ));
    return containers;
  }
}
