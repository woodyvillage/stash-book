import 'package:flutter/material.dart';
import 'package:stash_book/view/design/widget/molecules/simple_dashboard_molecules.dart';

class SimpleDashboardOrganisms extends StatefulWidget {
  const SimpleDashboardOrganisms({super.key});

  @override
  State createState() => _SimpleDashboardOrganismsState();
}

class _SimpleDashboardOrganismsState extends State<SimpleDashboardOrganisms> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SimpleDashboardMolecules();
  }
}
