import 'package:clean_core/clean_core.dart';
import 'package:objectbox/objectbox.dart';

@Entity() //flutter pub run build_runner build
class NoteEntity extends BasicEntityObject {
  @Id()
  int id;

  String title;
  String content;
  int color;

  //default construct, DON'T REMOVE
  NoteEntity({
    this.title = "Titulo",
    this.content = "",
    this.id = 0,
    this.color = 0,
  });

  //the one to use
  NoteEntity.build({
    required this.title,
    required this.content,
    this.id = 0,
    this.color = 0,
  });
}
