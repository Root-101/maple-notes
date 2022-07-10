import 'package:clean_core/clean_core.dart';
import 'package:flutter/material.dart';

class NoteDomain extends BasicDomainObject<NoteDomain> {
  int id;
  String title;
  String content;
  Color color;

  NoteDomain({
    required this.title,
    required this.content,
    this.id = 0,
    this.color = Colors.white,
  });
}
