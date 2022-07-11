import 'package:get/get.dart';
import 'package:maple_notes/maple_notes.dart';

abstract class NoteController extends GetxController {
  List<NoteDomain> findAll();

  int count();

  void createRandom();

  NotesViewTypeEnum currentView();

  void toggleView();

  void destroy(NoteDomain note);
}
