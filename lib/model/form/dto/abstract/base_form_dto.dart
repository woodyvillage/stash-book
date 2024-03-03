import 'dart:ui';

abstract class BaseFormDto {
  String? index;
  VoidCallback? callback;

  BaseFormDto({
    this.index,
    this.callback,
  });
}
