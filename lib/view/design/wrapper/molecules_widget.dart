import 'package:flutter/material.dart';
import 'package:stash_book/view/design/wrapper/wrapper.dart';

abstract class MoleculeWidget extends Wrapper {
  const MoleculeWidget({
    super.key,
    super.padding,
    super.margin,
  });

  Widget buildMolecule(final BuildContext context);

  @override
  Widget build(final BuildContext context) {
    final Widget child = buildMolecule(context);
    return buildWrapper(context, child) ?? child;
  }
}
