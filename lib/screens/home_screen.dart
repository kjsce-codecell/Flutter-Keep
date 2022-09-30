import 'package:flutter/material.dart';
import 'package:flutterkeep/constants.dart';
import 'package:flutterkeep/database/database_manager.dart';
import 'package:flutterkeep/helpers/note.dart';
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
  bool isLoading = false;
  List<Note> notesList = [];
  @override
  void initState() {
    super.initState();
    getNotesFromDatabase();
  }

  @override
  void dispose() {
    DatabaseManager.instance.close();
    super.dispose();
  }

  Future getNotesFromDatabase() async {
    setState(() => isLoading = true);
    notesList = await DatabaseManager.instance.getAllNotes();
    setState(() => isLoading = false);
  }

  Note getNoteFromId(int noteId) {
    return notesList.firstWhere((note) => note.id == noteId);
  }

  void onClickNote(int noteId) async {
    Note selectedNote = getNoteFromId(noteId);
    // if (selectedNote == null) return;
    var updatedNote = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditNote(
          isNew: false,
          selectedNote: selectedNote,
        ),
      ),
    );
    if (updatedNote != null) {
      setState(() async {
        if (updatedNote['isDelete'] == true) {
          await DatabaseManager.instance.delete(updatedNote['id']);
          getNotesFromDatabase();
          return;
        }
        await DatabaseManager.instance.update(Note(
            title: updatedNote['title'],
            note: updatedNote['note'],
            backgroundColor: kBackgroundColors[updatedNote['colorIndex']],
            textColor: kTextColors[updatedNote['colorIndex']],
            date: updatedNote['date'],
            id: updatedNote['id']));
        await getNotesFromDatabase();
      });
    }
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
              itemCount: notesList.length,
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
              itemBuilder: (BuildContext ctx, index) {
                Note currentNote = notesList[index];
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
            setState(() async {
              if (newNoteData['isDelete'] == true) return;
              await DatabaseManager.instance.insert(Note(
                  title: newNoteData['title'],
                  note: newNoteData['note'],
                  backgroundColor: kBackgroundColors[newNoteData['colorIndex']],
                  textColor: kTextColors[newNoteData['colorIndex']],
                  date: newNoteData['date']));
              getNotesFromDatabase();
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
