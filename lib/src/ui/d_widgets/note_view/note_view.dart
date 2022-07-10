import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maple_notes/maple_notes.dart';

class NoteView extends GetView<NoteController> {
  const NoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoteController>(
      builder: (_) {
        return Column(
          children: controller
              .findAll()
              .map(
                (e) => SingleNoteTile(
                  note: e,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
