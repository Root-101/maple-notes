import 'package:get/get.dart';
import 'package:maple_notes/maple_notes.dart';

class NoteControllerImpl extends NoteController {
  final NoteUseCase levelUseCase = Get.find<NoteUseCase>();

  @override
  List<NoteDomain> findAll() {
    return levelUseCase.findAll();
  }

  @override
  int count() {
    return levelUseCase.count();
  }
}
