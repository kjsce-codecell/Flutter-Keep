import 'package:flutter/material.dart';
import 'package:flutterkeep/constants.dart';
import 'package:flutterkeep/helpers/note.dart';

class NoteCard extends StatelessWidget {
  final Note noteData;
  final Function onClick;
  const NoteCard({super.key, required this.noteData, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await onClick(noteData.id),
      child: Card(
        color: Color(noteData.backgroundColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: <Widget>[
              Text(
                noteData.title.length > 100
                    ? '${noteData.title.substring(1, 100)}...'
                    : noteData.title,
                style: kTitleTextStyle.copyWith(
                  color: Color(noteData.textColor),
                ),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Color(noteData.textColor).withAlpha(200),
                ),
              ),
              Text(
                noteData.date,
                style: TextStyle(
                  color: Color(noteData.textColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
