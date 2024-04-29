import 'package:stash_book/const/common_const.dart';

// =============================================================================
// 定数
// =============================================================================
const int indexGeneral = 0;

const String settingsGeneral = 'GENERAL';

const String settingsMinimum = 'account_minimum';
const String settingsMaximum = 'account_maximum';
const String settingsRemarks = 'account_remarks';

// =============================================================================
// コンフィグアクションリスト
// =============================================================================
final settingsLists = [
  // 種別,キー,識別子,初期値,固定値
  [patternButton, 'C01', 'db_initialize', typeNothing, stringNull],
  [patternButton, 'C02', settingsMinimum, typeNumeric, stringNull],
  [patternButton, 'C03', settingsMaximum, typeNumeric, stringNull],
  [patternButton, 'C04', settingsRemarks, typeString, stringNull],
];
