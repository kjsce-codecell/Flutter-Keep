import 'package:flutter/material.dart';
import 'package:flutterkeep/constants.dart';
import 'package:flutterkeep/helpers/note.dart';
import 'package:flutterkeep/helpers/note_manager.dart';
import 'package:flutterkeep/widgets/note_card_widget.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

void main() => runApp(const FlutterKeep());

class FlutterKeep extends StatefulWidget {
  const FlutterKeep({super.key});

  @override
  State<FlutterKeep> createState() => _FlutterKeepState();
}

class _FlutterKeepState extends State<FlutterKeep> {
  bool isDark = false;
  NoteManager noteManager = NoteManager();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      theme: kLightThemeData,
      darkTheme: kDarkThemeData,
      home: Scaffold(
        appBar: AppBar(
          elevation: 3.0,
          title: const Text('📝Flutter Keep'),
          actions: <Widget>[
            IconButton(
              focusColor: Colors.black54,
              onPressed: () {
                setState(() {
                  isDark = !isDark;
                });
              },
              icon: Icon(
                  isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
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
                  );
                })),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
            size: 34,
          ),
        ),
      ),
    );
  }
}
