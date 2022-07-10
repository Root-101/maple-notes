import 'package:clean_core/clean_core.dart';
import 'package:maple_notes/maple_notes.dart';

class NoteUseCaseImpl extends DefaultCRUDUseCase<NoteDomain, NoteRepo>
    implements NoteUseCase {
  NoteUseCaseImpl(NoteRepo repo) : super(repo: repo);
}
