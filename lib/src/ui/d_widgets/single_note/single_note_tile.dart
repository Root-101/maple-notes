import 'package:flutter/material.dart';
import 'package:maple_notes/maple_notes.dart';

class SingleNoteTile extends StatelessWidget {
  final NoteDomain note;

  const SingleNoteTile({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: note.color,
      child: Column(
        children: [
          Text(
            note.title,
          ),
          Text(
            note.content,
          ),
        ],
      ),
    );
  }
}
