import 'package:flutter/cupertino.dart';
import 'package:stash_book/view/design/wrapper/wrapper.dart';

abstract class AtomWidget extends Wrapper {
  const AtomWidget({
    super.key,
    super.padding,
    super.margin,
  });

  // Material Design に則っているコンポーネントを実装
  Widget buildMaterial(final BuildContext context);

  // iOS スタイルに則っているコンポーネントを実装
  Widget? buildCupertino(final BuildContext context) => null;

  @override
  Widget build(final BuildContext context) {
    final Widget? cupertinoWidget = buildCupertino(context);
    final Widget materialWidget = buildMaterial(context);

    // OS に応じてコンポーネントを出し分け
    final Widget child = CupertinoUserInterfaceLevel.maybeOf(context) != null
        ? cupertinoWidget ?? materialWidget
        : materialWidget;

    return buildWrapper(context, child) ?? child;
  }
}
