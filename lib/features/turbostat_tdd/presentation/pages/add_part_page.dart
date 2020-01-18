import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/widgets.dart';

class AddPartPage extends StatelessWidget {
  const AddPartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: AddPartForm(),
    );
  }
}