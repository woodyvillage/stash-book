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
const int indexDeposit = 0;
const int indexExpense = 1;

final applicationLists = [
  [patternButton, 'A01', 'DEPOSIT', typeNumeric],
  [patternButton, 'A02', 'EXPENSE', typeNumeric],
];

// =============================================================================
// コマンドボタン
// =============================================================================
const functionSubmit = 'submit';
const functionCancel = 'cancel';

// =============================================================================
// お気に入りフォームリスト
// =============================================================================
final favoriteLists = [
  [patternEditor, 'F01', 'favorite_category', typeString],
  [patternEditor, 'F02', 'favorite_remarks', typeString],
  [patternEditor, 'F03', 'favorite_price', typeNumeric],
];
