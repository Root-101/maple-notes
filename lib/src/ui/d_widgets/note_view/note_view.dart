import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maple_notes/maple_notes.dart';

class NoteView extends GetView<NoteController> {
  const NoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoteController>(
      builder: (_) {
        return controller.currentView() == NotesViewTypeEnum.LIST
            ? buildListView()
            : buildGridView();
      },
    );
  }

  Widget buildListView() {
    List<NoteDomain> notes = controller.findAll();
    return ListView.builder(
      itemBuilder: (context, index) => SingleNoteTile(
        note: notes[index],
      ),
    );
  }

  Widget buildGridView() {
    List<NoteDomain> notes = controller.findAll();
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemBuilder: (context, index) => SingleNoteTile(
        note: notes[index],
      ),
    );
  }
}
