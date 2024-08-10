import 'package:stash_book/model/data/dto/favorite_dto.dart';
import 'package:stash_book/model/form/dto/favorite_floater_item_array_dto.dart';

class FavoriteFloaterItemArrayDao {
  FavoriteFloaterItemArrayDto createDto(
    List<List<Object>> list,
    FavoriteDto dto,
  ) {
    return FavoriteFloaterItemArrayDto(
      items: list,
      value: dto,
    );
  }
}
