import 'package:stash_book/model/form/dto/implement/base_form_impl.dart';

abstract class BaseFormDto implements BaseFormImpl {
  List<List<Object>>? items;

  BaseFormDto({
    this.items,
  });
}
