import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/view/design/wrapper/atoms_widget.dart';

class WithdrawButtonAtoms extends AtomWidget {
  const WithdrawButtonAtoms({
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
              Icons.indeterminate_check_box_outlined,
              color: Colors.white,
            ),
            label: Text(AppLocalizations.of(context)!.withdraw),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              minimumSize: const Size(100, 40),
            ),
            onPressed: callback,
          ),
        ],
      ),
    );
  }
}
