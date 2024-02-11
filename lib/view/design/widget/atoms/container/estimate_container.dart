import 'package:flutter/material.dart';
import 'package:stash_book/view/design/wrapper/atoms_widget.dart';

class EstimateContainerAtoms extends AtomWidget {
  const EstimateContainerAtoms({super.key});

  @override
  Widget buildMaterial(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Text(
            '残高：',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 36,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 180,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Text(
            '1234567',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 48,
            ),
          ),
        ),
      ],
    );
  }
}
