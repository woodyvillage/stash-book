import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/view/design/wrapper/atoms_widget.dart';

class AccountContainerAtoms extends AtomWidget {
  const AccountContainerAtoms({
    super.key,
    required this.bloc,
  });
  final ApplicationBloc bloc;

  @override
  Widget buildMaterial(BuildContext context) {
    final formatter = NumberFormat("#,##0");
    return Row(
      children: [
        Container(
          width: 120,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              AppLocalizations.of(context)!.balance,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 36,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 150,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: StreamBuilder(
            stream: bloc.inquiry,
            builder: (context, snapshot) {
              // Streamがnullの時の対策
              int? displayInquiry = 0;
              if (snapshot.hasData) {
                displayInquiry = snapshot.data;
              }
              return Text(
                formatter.format(displayInquiry),
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 48,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
