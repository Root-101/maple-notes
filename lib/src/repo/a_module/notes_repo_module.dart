import 'dart:io';

import 'package:maple_notes/maple_notes.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

class NoteRepoModule {
  static late final Store
      _STORE; //todo: posible null pointer, llamar primero al constructor

  static late final NoteRepo noteRepo;

  static const _NoteDir = "/maple_notes";

  static Future<bool> init({String parentDirectory = ""}) async {
    //obtiene el directorio por defecto
    Directory defaultDir = await defaultStoreDirectory();

    //se concatenan las direcciones
    Directory dbDir = Directory('${defaultDir.path}$parentDirectory$_NoteDir');

    //Se crea el directorio por si no está creado
    dbDir = await dbDir.create(recursive: true);

    _STORE = await openStore(directory: dbDir.path);

    NoteRepoExternal subLevelProgressRepoExternal =
        NoteRepoExternalImpl(_STORE);

    noteRepo = NoteRepoImpl(subLevelProgressRepoExternal);

    return _STORE != null;
  }

  static void dispose() {
    _STORE.close();
  }
}
