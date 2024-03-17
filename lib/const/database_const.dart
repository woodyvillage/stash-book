class DatabaseConst {
  // データベース定義
  static const databaseName = 'StashBook.db';
  static const databaseVersion = 2;

  // 残金テーブル
  static const tableInquiry = "inquiry";
  static const columnInquiry = 'inquiry';

  // 入出金テーブル
  static const tableAccount = "account";
  static const columnId = 'id';
  static const columnDate = 'date';
  static const columnRemarks = 'remarks';
  static const columnPrice = 'price';
  static const columnFavorite = 'remarks';

  static final ddlScripts = {
    '0': ['SELECT $columnInquiry FROM $tableInquiry;'],
    '1': ['CREATE TABLE $tableInquiry ($columnInquiry INTEGER NOT NULL);'],
    '2': [
      'CREATE TABLE $tableAccount ($columnId INTEGER PRIMARY KEY, $columnDate TEXT NOT NULL, $columnRemarks TEXT, $columnPrice INTEGER NOT NULL);'
    ],
  };
}
