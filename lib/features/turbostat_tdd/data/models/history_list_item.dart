import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/part_model.dart';

//TODO убрать если не используется

abstract class HistoryListItem {}

class EntryItem implements HistoryListItem {
  final EntryModel entry;

  EntryItem(this.entry);
}

class PartItem implements HistoryListItem {
  final PartModel part;

  PartItem(this.part);
}
