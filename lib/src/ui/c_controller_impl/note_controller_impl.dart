import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maple_notes/maple_notes.dart';

class NoteControllerImpl extends NoteController {
  final NoteUseCase noteUC = Get.find<NoteUseCase>();
  final NotesViewTypeUseCase viewTypeUC = Get.find<NotesViewTypeUseCase>();

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
    noteUC.create(
      NoteDomain(
        title: "Title: ${Random().nextInt(5000)}",
        content: """
Content: ${Random().nextInt(5000)}

# Yeah baby

***italic bold 1***

☻

:+1:
        """,
        color: Colors.primaries[Random().nextInt(
          Colors.primaries.length,
        )],
      ),
    );
    update();
  }

  @override
  void destroy(NoteDomain note) {
    noteUC.destroy(note);
    update();
  }

  @override
  void toggleView() {
    viewTypeUC.toggleView();
    update();
  }

  @override
  NotesViewTypeEnum currentView() {
    return viewTypeUC.getCurrentValue();
  }
}
