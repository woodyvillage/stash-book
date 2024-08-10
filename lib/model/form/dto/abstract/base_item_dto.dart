import 'dart:ui';

abstract class BaseItemDto {
  String? index;
  VoidCallback? callback;

  BaseItemDto({
    this.index,
    this.callback,
  });
}
