import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/view/design/wrapper/atoms_widget.dart';

class DepositButtonAtoms extends AtomWidget {
  const DepositButtonAtoms({
    super.key,
    required this.callback,
  });
  final VoidCallback callback;

  @override
  Widget buildMaterial(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton.icon(
            icon: const Icon(
              Icons.add_box_outlined,
              color: Colors.white,
            ),
            label: Text(AppLocalizations.of(context)!.deposit),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              minimumSize: const Size(200, 40),
            ),
            onPressed: callback,
          ),
        ],
      ),
    );
  }
}
