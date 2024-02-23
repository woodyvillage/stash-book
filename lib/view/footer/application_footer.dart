import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:stash_book/const/routing_const.dart';
import 'package:stash_book/service/navigator_position_service.dart';

class ApplicationFooter extends StatefulWidget {
  const ApplicationFooter({super.key});

  @override
  State createState() => _ApplicationFooterState();
}

class _ApplicationFooterState extends State<ApplicationFooter> {
  @override
  void initState() {
    super.initState();
  }

  void onItemTapped(int index) {
    setState(() {
      contentsController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  List<BottomNavigationBarItem> buildBarItem() {
    final List<BottomNavigationBarItem> barItems = [];
    for (var i = 0; i < contentsIcons.length; i++) {
      barItems.add(BottomNavigationBarItem(
        icon: contentsIcons[i],
        label: AppLocalizations.of(context)!.contents(contentsTexts[i]),
      ));
    }
    return barItems;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).primaryColorDark,
      items: buildBarItem(),
      // selectedRouteの現在値をcurrentとする
      currentIndex:
          // ChangeNotifierProviderの通知を見ている
          Provider.of<NavigatorPositionService>(context).selectedRoute,
      onTap: onItemTapped,
    );
  }
}
