import 'package:clean_core/clean_core.dart';
import 'package:flutter/material.dart';
import 'package:maple_notes/maple_notes.dart';

class NoteAppModule {
  static Future init() async {
    await NotesUIModule.init();

    AppModuleRegister.register(
      NOTES_MODULE,
    );
  }

  static final AppModule NOTES_MODULE = AppModule(
    mainModules: [
      AppMainModule(
        moduleName: "Notas",
        moduleIcon: Icons.note_rounded,
        moduleHomePage: const NotesHomepage(),
      ),
      AppMainModule(
        moduleName: "Notas 2",
        moduleIcon: Icons.note_rounded,
        moduleHomePage: const NotesHomepage(),
      ),
    ],
    initScreen: [
      AppModuleInitScreen(
        initName: "Notas",
        initImage: "image src",
        initDescription: "App de notas",
      ),
      AppModuleInitScreen(
        initName: "Notas 2",
        initImage: "image src 2",
        initDescription: "App de notas 2",
      ),
    ],
    utils: [
      AppUtilModule(
        utilName: "Notas Add",
        utilIcon: Icons.note_add_outlined,
        utilPage: const NotesHomepage(),
      ),
      AppUtilModule(
        utilName: "Notas Add 2",
        utilIcon: Icons.note_add_outlined,
        utilPage: const NotesHomepage(),
      )
    ],
  );
}
