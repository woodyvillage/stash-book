import 'package:flutter/material.dart';

abstract class Wrapper extends StatelessWidget {
  const Wrapper({
    super.key,
    final EdgeInsetsGeometry padding = EdgeInsets.zero,
    final EdgeInsetsGeometry margin = EdgeInsets.zero,
  })  : _padding = padding,
        _margin = margin;

  final EdgeInsetsGeometry _padding;
  final EdgeInsetsGeometry _margin;

  Widget? buildWrapper(
    final BuildContext context,
    final Widget? child,
  ) =>
      // padding や margin が指定されている場合は Padding で子要素を包含する
      _padding != EdgeInsets.zero || _margin != EdgeInsets.zero
          ? Padding(
              padding: _padding.add(_margin),
              child: child,
            )
          : null;
}
