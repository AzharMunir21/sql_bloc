abstract class SqlEvents {}

class SqlInsertEvent extends SqlEvents {
  final Map<String, dynamic> row;
  SqlInsertEvent({
    required this.row,
  });
}

class SqlDeleteEvent extends SqlEvents {}

class SqlUpdateEvent extends SqlEvents {}

class SqlReadEvent extends SqlEvents {}
