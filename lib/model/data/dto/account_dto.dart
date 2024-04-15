import 'package:stash_book/const/database_const.dart';

class AccountDto {
  int no;
  String date;
  String remarks;
  int price;
  int mode;

  AccountDto({
    required this.no,
    required this.date,
    required this.remarks,
    required this.price,
    required this.mode,
  });

  // DBから読み取った値をDTOに詰める
  factory AccountDto.parse(Map<String, dynamic> record) => AccountDto(
        no: record[DatabaseConst.columnNo],
        date: record[DatabaseConst.columnDate],
        remarks: record[DatabaseConst.columnRemarks],
        price: record[DatabaseConst.columnPrice],
        mode: record[DatabaseConst.columnMode],
      );

  // DBにDTOのデータをinsertする
  Map<String, dynamic> toMap() => {
        DatabaseConst.columnDate: date,
        DatabaseConst.columnRemarks: remarks,
        DatabaseConst.columnPrice: price,
        DatabaseConst.columnMode: mode,
      };
}
