import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
    return AnimationLimiter(
      key: const ValueKey("notes_list_view"),
      child: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 500),
          child: ScaleAnimation(
            scale: 0.5,
            child: FadeInAnimation(
              child: SingleNoteTile(
                note: notes[index],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGridView() {
    List<NoteDomain> notes = controller.findAll();
    const int cantColumns = 2;
    return AnimationLimiter(
      key: const ValueKey("notes_grid_view"),
      child: GridView.builder(
        itemCount: notes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: cantColumns,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemBuilder: (context, index) => AnimationConfiguration.staggeredGrid(
          columnCount: cantColumns,
          position: index,
          duration: const Duration(milliseconds: 500),
          child: ScaleAnimation(
            scale: 0.5,
            child: FadeInAnimation(
              child: SingleNoteTile(
                note: notes[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
