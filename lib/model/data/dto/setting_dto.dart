import 'package:stash_book/const/database_const.dart';

class SettingDto {
  int index;
  String key;
  String value;

  SettingDto({
    required this.index,
    required this.key,
    required this.value,
  });

  // DBから読み取った値をDTOに詰める
  factory SettingDto.parse(Map<String, dynamic> record) => SettingDto(
        index: record[DatabaseConst.columnSequence],
        key: record[DatabaseConst.columnKey],
        value: record[DatabaseConst.columnValue],
      );

  // DBにDTOのデータをinsertする
  Map<String, dynamic> toMap() => {
        DatabaseConst.columnSequence: index,
        DatabaseConst.columnKey: key,
        DatabaseConst.columnValue: value,
      };
}
