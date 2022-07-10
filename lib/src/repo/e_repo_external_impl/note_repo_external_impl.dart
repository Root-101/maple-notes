import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';
import 'package:maple_notes/maple_notes.dart';

class HangManSubLevelProgressRepoExternalImpl
    extends DefaultObjectBoxCRUDRepositoryExternal<NoteEntity>
    implements NoteRepoExternal {
  HangManSubLevelProgressRepoExternalImpl(Store store) : super(store);
}
