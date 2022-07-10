import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';
import 'package:maple_notes/maple_notes.dart';

class NoteRepoExternalImpl
    extends DefaultObjectBoxCRUDRepositoryExternal<NoteEntity>
    implements NoteRepoExternal {
  NoteRepoExternalImpl(Store store) : super(store);
}
