import 'package:flutter/material.dart';

class NoDataView extends StatelessWidget {
  const NoDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Aucune donnee pour le lieux selectionne"),
    );
  }
}
