import 'package:stash_book/const/database_const.dart';

class PossessionDto {
  int possession; // 残金

  PossessionDto({required this.possession});

  // DBから読み取った値をDTOに詰める
  factory PossessionDto.parse(Map<String, dynamic> record) => PossessionDto(
        possession: record[DatabaseConst.columnPossession],
      );

  // DBにDTOのデータをinsertする
  Map<String, dynamic> toMap() => {
        DatabaseConst.columnPossession: possession,
      };
}
