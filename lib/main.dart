import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stash_book/service/navigator_position_service.dart';
import 'package:stash_book/view/application_root.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => NavigatorPositionService(),
      ),
    ],
    child: const ApplicationRoot(),
  ));
}
