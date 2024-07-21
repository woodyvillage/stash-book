import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/view/design/widget/atoms/button/dialog_button.dart';
import 'package:stash_book/view/design/widget/atoms/dialog/simple_dialog.dart';
import 'package:stash_book/view/design/wrapper/molecules_widget.dart';
import 'package:stash_book/view/utility/callback_utility.dart';
import 'package:stash_book/view/utility/contents_utility.dart';

class MultiInputDialogMolecules extends MoleculeWidget {
  const MultiInputDialogMolecules({
    super.key,
    required this.items,
  });
  final List<List<Object>> items;

  @override
  Widget buildMolecule(BuildContext context) {
    TextEditingController categoryCtrl = TextEditingController();
    TextEditingController remarksCtrl = TextEditingController();
    TextEditingController priceCtrl = TextEditingController();
    List<TextEditingController> controllers = [
      categoryCtrl,
      remarksCtrl,
      priceCtrl,
    ];
    return SimpleDialogAtoms(
      title: Text(AppLocalizations.of(context)!.favorite_caption),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: buildMultiEditors(context, items, controllers),
      ),
      actions: buildMolecules(context, controllers),
    );
  }

  List<Widget> buildMolecules(
      BuildContext context, List<TextEditingController> controllers) {
    List<Widget> containers = [];
    containers.add(DialogButtonAtoms(
      title: AppLocalizations.of(context)!.cancel,
      callback: makeReturnCallback(context),
    ));
    containers.add(DialogButtonAtoms(
      title: AppLocalizations.of(context)!.submit,
      callback: makeResultsCallback(context, controllers),
    ));
    return containers;
  }

  List<Widget> buildMultiEditors(
    BuildContext context,
    List<List<Object>> items,
    List<TextEditingController> controllers,
  ) {
    List<Widget> multi = [];

    //
    int i = 0;
    for (var item in items) {
      //
      TextField field = TextField(
        controller: controllers[i],
        decoration: getHint(context, item[indexKey].toString()),
        keyboardType: getKeyType(context, item[indexKey].toString()),
        inputFormatters: getFormat(context, item[indexKey].toString()),
      );
      multi.add(field);
      i++;
    }
    return multi;
  }
}
