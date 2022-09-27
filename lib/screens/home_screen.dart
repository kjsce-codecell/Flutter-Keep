import 'package:flutter/material.dart';
import 'package:flutterkeep/constants.dart';
import 'package:flutterkeep/helpers/note.dart';
import 'package:flutterkeep/helpers/note_manager.dart';
import 'package:flutterkeep/screens/edit_note_screen.dart';
import 'package:flutterkeep/widgets/note_card_widget.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class Home extends StatefulWidget {
  VoidCallback changeTheme;
  bool isDark;
  Home({super.key, required this.changeTheme, required this.isDark});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NoteManager noteManager = NoteManager();
  void onClickNote(int noteId) {
    Note? selectedNote = noteManager.getNoteFromId(noteId);
    if (selectedNote == null) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditNote(
          isNew: true,
          selectedNote: selectedNote,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        title: const Text('📝Flutter Keep'),
        actions: <Widget>[
          IconButton(
            focusColor: Colors.black54,
            onPressed: widget.changeTheme,
            icon: Icon(widget.isDark
                ? Icons.light_mode_rounded
                : Icons.dark_mode_rounded),
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: StaggeredGridView.countBuilder(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              itemCount: noteManager.notesList.length,
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
              itemBuilder: (BuildContext ctx, index) {
                Note currentNote = noteManager.notesList[index];
                return NoteCard(
                  noteData: currentNote,
                  onClick: onClickNote,
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var newNoteData = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditNote(
                isNew: true,
              ),
            ),
          );
          if (newNoteData != null) {
            setState(() {
              noteManager.addNewNote(
                  title: newNoteData['title'],
                  note: newNoteData['note'],
                  backgroundColor: kBackgroundColors[newNoteData['colorIndex']],
                  textColor: kTextColors[newNoteData['colorIndex']],
                  date: newNoteData['date']);
            });
          }
        },
        child: const Icon(
          Icons.add,
          size: 34,
        ),
      ),
    );
  }
}
