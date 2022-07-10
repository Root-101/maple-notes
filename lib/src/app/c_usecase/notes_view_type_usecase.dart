import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';
import 'package:maple_notes/maple_notes.dart';

abstract class NotesViewTypeUseCase extends SingleKeyValueUseCase<String, int> {
  void changeView(NotesViewTypeEnum type);

  NotesViewTypeEnum getCurrentValue();
}
