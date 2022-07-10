import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maple_notes/maple_notes.dart';

class NotesUIModule {
  static const String MODULE_NAME = "Notas";
  static Color PRIMARY_COLOR = Colors.yellow[800]!;
  static const Color SECONDARY_COLOR = Colors.blue;
  static const IconData ICON = Icons.note;

  static Future init() async {
    await NoteCoreModule.init();

    Get.put<NoteController>(NoteControllerImpl());
  }
}
