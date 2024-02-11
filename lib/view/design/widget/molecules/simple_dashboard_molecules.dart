import 'package:flutter/material.dart';
import 'package:stash_book/view/design/widget/atoms/button/deposit_button.dart';
import 'package:stash_book/view/design/widget/atoms/card/simple_card.dart';
import 'package:stash_book/view/design/widget/atoms/container/estimate_container.dart';
import 'package:stash_book/view/design/wrapper/molecules_widget.dart';

class SimpleDashboardMolecules extends MoleculeWidget {
  const SimpleDashboardMolecules({super.key});

  @override
  Widget buildMolecule(final BuildContext context) {
    return SimpleCardAtoms(
      child: buildMolecules(context),
    );
  }

  List<Widget> buildMolecules(final BuildContext context) {
    List<Widget> containers = [];
    containers.add(const EstimateContainerAtoms());
    containers.add(const DepositButtonAtoms());
    return containers;
  }
}
