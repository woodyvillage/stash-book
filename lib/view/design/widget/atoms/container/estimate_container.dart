import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/view/design/wrapper/atoms_widget.dart';

class EstimateContainerAtoms extends AtomWidget {
  const EstimateContainerAtoms({super.key});

  @override
  Widget buildMaterial(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 120,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              AppLocalizations.of(context)!.balance,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 36,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 150,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Text(
            '1234567',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 48,
            ),
          ),
        ),
      ],
    );
  }
}
