import 'package:stash_book/const/database_const.dart';

class SettingDto {
  int no;
  String key;
  String value;

  SettingDto({
    required this.no,
    required this.key,
    required this.value,
  });

  // DBから読み取った値をDTOに詰める
  factory SettingDto.parse(Map<String, dynamic> record) => SettingDto(
        no: record[DatabaseConst.columnNo],
        key: record[DatabaseConst.columnKey],
        value: record[DatabaseConst.columnValue],
      );

  // DBにDTOのデータをinsertする
  Map<String, dynamic> toMap() => {
        DatabaseConst.columnNo: no,
        DatabaseConst.columnKey: key,
        DatabaseConst.columnValue: value,
      };
}
