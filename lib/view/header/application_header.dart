import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/view/configuration/configuration_frame.dart';

class ApplicationHeader extends StatelessWidget implements PreferredSizeWidget {
  const ApplicationHeader({
    super.key,
    required this.isView,
  });
  final bool isView;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    if (isView) {
      return AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.applicationTitle),
        actions: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                MaterialPageRoute settingPageRoute = MaterialPageRoute(
                  builder: (context) => const ConfigurationFrame(),
                );
                Navigator.push(
                  context,
                  settingPageRoute,
                );
              },
            ),
          ),
        ],
      );
    } else {
      return AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.applicationSettingTitle),
      );
    }
  }
}
