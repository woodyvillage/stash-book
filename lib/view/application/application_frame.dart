import 'package:flutter/material.dart';
import 'package:stash_book/view/header/application_header.dart';

class ApplicationFrame extends StatefulWidget {
  const ApplicationFrame({super.key});

  @override
  State<ApplicationFrame> createState() => _ApplicationFrameState();
}

class _ApplicationFrameState extends State<ApplicationFrame> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // ヘッダー
      appBar: ApplicationHeader(isView: true),
      // コンテンツ
      body: ApplicationContents(),
      // ナビゲーター
      bottomNavigationBar: ApplicationFooter(),
    );
  }
}
