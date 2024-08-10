import 'package:stash_book/const/common_const.dart';

// =============================================================================
// 定数
// =============================================================================
// アプリケーションのページインデックス
const int indexReceipt = 0;
const int indexMenu = 1;

// アプリケーションのページネーム
const String contentsActivity = 'ACTIVITY';
const String contentsFavorite = 'FAVORITE';

// アプリケーションのフロートネーム
const String floaterActivity = 'ACTIVITY_ADD';
const String floaterFavorite = 'FAVORITE_ADD';

// =============================================================================
// アプリケーションアクションリスト
// =============================================================================
// 固定インデックス
const int indexDeposit = 0; // 入金
const int indexWithdraw = 1; // 出金

final applicationLists = [
  [patternButton, 'A01', 'DEPOSIT', typeNumeric],
  [patternButton, 'A02', 'WITHDRAW', typeNumeric],
];

// =============================================================================
// 入出金フォームリスト
// =============================================================================
final accountLists = [
  [patternPicker, 'F11', 'dialog_date', typeString],
  [patternEditor, 'F12', 'dialog_remarks', typeString],
  [patternEditor, 'F13', 'dialog_price', typeNumeric],
];

// =============================================================================
// お気に入りフォームリスト
// =============================================================================
final favoriteLists = [
  [patternEditor, 'F21', 'dialog_category', typeString],
  [patternEditor, 'F22', 'dialog_remarks', typeString],
  [patternEditor, 'F23', 'dialog_price', typeNumeric],
];
