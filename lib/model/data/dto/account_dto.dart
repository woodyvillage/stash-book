import 'package:stash_book/const/database_const.dart';

class AccountDto {
  int id;
  String date;
  String remarks;
  int price;

  AccountDto({
    required this.id,
    required this.date,
    required this.remarks,
    required this.price,
  });

  // DBから読み取った値をDTOに詰める
  factory AccountDto.parse(Map<String, dynamic> record) => AccountDto(
        id: record[DatabaseConst.columnId],
        date: record[DatabaseConst.columnDate],
        remarks: record[DatabaseConst.columnRemarks],
        price: record[DatabaseConst.columnPrice],
      );

  // DBにDTOのデータをinsertする
  Map<String, dynamic> toMap() => {
        DatabaseConst.columnId: id,
        DatabaseConst.columnDate: date,
        DatabaseConst.columnRemarks: remarks,
        DatabaseConst.columnPrice: price,
      };
}
