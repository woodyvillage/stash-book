import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/const/application_const.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/model/form/dto/abstract/base_form_dto.dart';
import 'package:stash_book/view/design/widget/atoms/button/dialog_button.dart';
import 'package:stash_book/view/design/widget/atoms/dialog/simple_dialog.dart';
import 'package:stash_book/view/design/wrapper/molecules_widget.dart';
import 'package:stash_book/view/utility/callback_utility.dart';
import 'package:stash_book/view/utility/contents_utility.dart';

class MultiInputDialogMolecules<T extends BaseFormDto> extends MoleculeWidget {
  const MultiInputDialogMolecules({
    super.key,
    required this.title,
    required this.items,
  });
  final String title;
  final T items;

  @override
  Widget buildMolecule(BuildContext context) {
    List<TextEditingController> controllers = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ];
    return SimpleDialogAtoms(
      title: title == contentsActivity
          ? Text(AppLocalizations.of(context)!.account_caption)
          : Text(AppLocalizations.of(context)!.favorite_caption),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: buildMultiEditors(context, controllers, items),
      ),
      actions: buildMolecules(context, controllers),
    );
  }

  List<Widget> buildMultiEditors(
    BuildContext context,
    List<TextEditingController> controllers,
    T items,
  ) {
    List<Widget> multi = [];

    int i = 0;
    for (var item in items.items!) {
      if (item[indexType].toString() == patternEditor) {
        // テキスト入力
        TextField field = TextField(
          controller: getDefault(
            controllers[i],
            item[indexKey].toString(),
            items.dto,
          ),
          decoration: getHint(context, item[indexKey].toString()),
          keyboardType: getKeyType(context, item[indexKey].toString()),
          inputFormatters: getFormat(context, item[indexKey].toString()),
        );
        multi.add(field);
      }
      i++;
    }
    return multi;
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
      callback: makeResultsCallback(context, controllers, items.dto),
    ));
    return containers;
  }
}
