import 'package:flutter/material.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/const/application_const.dart';
import 'package:stash_book/view/design/widget/atoms/button/deposit_button.dart';
import 'package:stash_book/view/design/widget/atoms/button/expense_button.dart';
import 'package:stash_book/view/design/widget/atoms/card/simple_card.dart';
import 'package:stash_book/view/design/widget/atoms/container/account_container.dart';
import 'package:stash_book/view/design/wrapper/molecules_widget.dart';
import 'package:stash_book/view/utility/callback_utility.dart';

class SimpleDashboardMolecules extends MoleculeWidget {
  const SimpleDashboardMolecules({
    super.key,
    required this.bloc,
    required this.func,
  });
  final ApplicationBloc bloc;
  final VoidCallback func;

  @override
  Widget buildMolecule(final BuildContext context) {
    return SimpleCardAtoms(
      child: buildMolecules(context),
    );
  }

  List<Widget> buildMolecules(final BuildContext context) {
    List<Widget> containers = [];
    containers.add(AccountContainerAtoms(bloc: bloc));
    containers.add(Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ExpenseButtonAtoms(
          callback: makeCallback(
            context,
            applicationLists[indexExpense],
          ),
        ),
        DepositButtonAtoms(
          callback: makeCallback(
            context,
            applicationLists[indexDeposit],
          ),
        ),
      ],
    ));
    return containers;
  }
}
