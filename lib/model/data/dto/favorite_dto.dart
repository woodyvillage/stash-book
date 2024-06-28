import 'package:stash_book/const/database_const.dart';

class FavoriteDto {
  int no;
  String category;
  String remarks;
  int price;

  FavoriteDto({
    required this.no,
    required this.category,
    required this.remarks,
    required this.price,
  });

  // DBから読み取った値をDTOに詰める
  factory FavoriteDto.parse(Map<String, dynamic> record) => FavoriteDto(
        no: record[DatabaseConst.columnNo],
        category: record[DatabaseConst.columnCategory],
        remarks: record[DatabaseConst.columnRemarks],
        price: record[DatabaseConst.columnPrice],
      );

  // DBにDTOのデータをinsertする
  Map<String, dynamic> toMap() => {
        DatabaseConst.columnCategory: category,
        DatabaseConst.columnRemarks: remarks,
        DatabaseConst.columnPrice: price,
      };
}
