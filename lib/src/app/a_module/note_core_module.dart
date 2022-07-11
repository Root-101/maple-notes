import 'package:get/get.dart';
import 'package:maple_notes/maple_notes.dart';

class NoteCoreModule {
  static Future init() async {
    await NoteRepoModule.init();

    Get.put<NoteUseCase>(
      NoteUseCaseImpl(NoteRepoModule.noteRepo),
    );
    Get.put<NotesViewTypeUseCase>(
      NotesViewTypeUseCaseImpl(),
    );
  }

  static void dispose() {
    NoteRepoModule.dispose();
    Get.deleteAll(force: true);
  }
}
