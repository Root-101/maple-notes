import 'package:clean_core/clean_core.dart';

class NoteDomain extends BasicDomainObject<NoteDomain> {
  int id;
  String title;
  String content;
  int color;

  NoteDomain({
    required this.title,
    required this.content,
    this.id = 0,
    this.color = 0,
  });
}
