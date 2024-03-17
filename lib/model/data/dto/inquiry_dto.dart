import 'package:stash_book/const/database_const.dart';

class InquiryDto {
  int inquiry; // 残金

  InquiryDto({required this.inquiry});

  // DBから読み取った値をDTOに詰める
  factory InquiryDto.parse(Map<String, dynamic> record) => InquiryDto(
        inquiry: record[DatabaseConst.columnInquiry],
      );

  // DBにDTOのデータをinsertする
  Map<String, dynamic> toMap() => {
        DatabaseConst.columnInquiry: inquiry,
      };
}
