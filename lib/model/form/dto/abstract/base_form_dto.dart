import 'dart:ui';

abstract class BaseFormDto {
  VoidCallback? callback;

  BaseFormDto({
    this.callback,
  });
}
