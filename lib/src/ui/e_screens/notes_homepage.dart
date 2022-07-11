import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maple_notes/maple_notes.dart';

class NotesHomepage extends GetView<NoteController> {
  static const ROUTE_NAME = "/notes-homepage";

  const NotesHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              controller.createRandom();
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
          IconButton(
            onPressed: () {
              controller.toggleView();
            },
            icon: Icon(
              controller.currentView() == NotesViewTypeEnum.LIST
                  ? Icons.grid_3x3
                  : Icons.list,
            ),
          )
        ],
      ),
      body: NoteView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => controller.createRandom(),
        backgroundColor: Colors.green,
      ),
    );
  }
}
