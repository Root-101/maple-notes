import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:maple_notes/maple_notes.dart';
import 'package:markdown/markdown.dart' as md;

class SingleNoteTile extends GetView<NoteController> {
  final NoteDomain note;

  const SingleNoteTile({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.destroy(note),
      child: Container(
        decoration: BoxDecoration(
          color: note.color,
          border: Border.all(
            color: Colors.black45,
          ),
        ),
        child: Column(
          children: [
            Text(
              note.title,
            ),
            MarkdownBody(
              data: note.content,
              selectable: true,
              extensionSet: md.ExtensionSet(
                md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                [
                  md.EmojiSyntax(),
                  ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
