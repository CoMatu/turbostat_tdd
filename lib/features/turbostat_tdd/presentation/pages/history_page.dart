import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/entries.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Entries>(
      builder: (context, entry, child) {
        return ListView.builder(
          itemCount: entry.entries.length,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.all(12.0),
            child: entry.entries.length != 0
                ? Text(entry.entries[index].maintenanceId)
                : Text('На этой странице еще нет ни одной записи'),
          ),
        );
      },
    );
  }
}
