import 'package:clean_core/clean_core.dart';

class NoteEntity extends BasicDomainObject<NoteEntity> {
  int id;
  String title;
  String content;
  int color;

  NoteEntity({
    required this.title,
    required this.content,
    this.id = 0,
    this.color = 0,
  });
}
