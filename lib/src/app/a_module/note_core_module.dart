import 'package:get/get.dart';
import 'package:maple_notes/maple_notes.dart';

class NoteCoreModule {
  static Future init() async {
    await NoteRepoModule.init();

    //el de progreso con la BD
    Get.put<NoteUseCase>(
      NoteUseCaseImpl(NoteRepoModule.noteRepo),
    );
  }

  static void dispose() {
    NoteRepoModule.dispose();
    Get.deleteAll(force: true);
  }
}
