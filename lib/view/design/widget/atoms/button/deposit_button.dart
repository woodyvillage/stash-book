import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/view/design/wrapper/atoms_widget.dart';

class DepositButtonAtoms extends AtomWidget {
  const DepositButtonAtoms({
    super.key,
  });

  @override
  Widget buildMaterial(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.add_box_outlined,
        color: Colors.white,
      ),
      label: Text(AppLocalizations.of(context)!.deposit),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      onPressed: () {},
    );
  }
}
