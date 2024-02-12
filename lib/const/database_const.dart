class DatabaseConst {
  // データベース定義
  static const databaseName = 'StashBook.db';
  static const databaseVersion = 1;

  // アカウントテーブル
  static const tableAccount = "account";
  static const columnInquiry = 'inquiry';

  static final ddlScripts = {
    '0': ['SELECT $columnInquiry FROM $tableAccount;'],
    '1': ['CREATE TABLE $tableAccount ($columnInquiry INTEGER NOT NULL);'],
  };
}
