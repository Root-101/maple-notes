import 'dart:math';

import 'package:get/get.dart';
import 'package:maple_notes/maple_notes.dart';

class NoteControllerImpl extends NoteController {
  final NoteUseCase noteUC = Get.find<NoteUseCase>();

  @override
  List<NoteDomain> findAll() {
    return noteUC.findAll();
  }

  @override
  int count() {
    return noteUC.count();
  }

  @override
  void createRandom() {
    noteUC.create(NoteDomain(
      title: "Title: ${Random().nextInt(5000)}",
      content: "Content: ${Random().nextInt(5000)}",
    ));
  }
}
