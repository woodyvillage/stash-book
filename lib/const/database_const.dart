class DatabaseConst {
  // データベース定義
  static const databaseName = 'StashBook.db';
  static const databaseVersion = 1;

  // 残金テーブル
  static const tableInquiry = "inquiry";
  static const columnInquiry = 'inquiry';

  static final ddlScripts = {
    '0': ['SELECT $columnInquiry FROM $tableInquiry;'],
    '1': ['CREATE TABLE $tableInquiry ($columnInquiry INTEGER NOT NULL);'],
  };
}
