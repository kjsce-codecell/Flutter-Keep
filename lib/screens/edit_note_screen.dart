import 'package:flutter/material.dart';
import 'package:flutterkeep/constants.dart';
import 'package:flutterkeep/helpers/note.dart';
import 'package:flutterkeep/widgets/bottom_button.dart';
import 'package:flutterkeep/widgets/color_container.dart';

class EditNote extends StatefulWidget {
  bool isNew;
  Note? selectedNote;
  EditNote({super.key, required this.isNew, this.selectedNote});
  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  String title = '';
  String note = '';
  String dateToday = DateTime.now().toString().substring(0, 10);
  int selectedColorIndex = 0; // Default background color selected for note.
  String errorTextTitle = '';
  String errorTextNote = '';
  @override
  void initState() {
    super.initState();
    if (widget.isNew == false) {
      for (var i = 0; i < kBackgroundColors.length; i++) {
        if (widget.selectedNote?.backgroundColor == kBackgroundColors[i]) {
          selectedColorIndex = i;
        }
      }
      title = widget.selectedNote?.title ?? '';
      note = widget.selectedNote?.note ?? '';
    }
  }

  void updateBackgroundColorOnClick(int colorIndex) {
    setState(() {
      selectedColorIndex = colorIndex;
    });
  }

  List<Widget> getColorContainerList() {
    List<ColorContainer> children = [];
    for (int i = 0; i < kBackgroundColors.length; i++) {
      children.add(
        ColorContainer(
          colorIndex: i,
          backgroundColor: kBackgroundColors[i],
          checkIConColor: kTextColors[i],
          isSelected: selectedColorIndex == i ? true : false,
          onClick: updateBackgroundColorOnClick,
        ),
      );
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(kBackgroundColors[selectedColorIndex]),
      appBar: AppBar(
        title: Text(widget.isNew ? 'Add new Note' : 'Edit Note'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: TextEditingController(
                    text: widget.isNew ? title : widget.selectedNote?.title),
                style: TextStyle(color: Color(kTextColors[selectedColorIndex])),
                decoration: kInputFieldDecoration.copyWith(
                  fillColor:
                      Color(kTextColors[selectedColorIndex]).withOpacity(0.15),
                  errorText: errorTextTitle,
                  errorStyle: TextStyle(
                      color: Color(kTextColors[selectedColorIndex]),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                onChanged: (value) {
                  title = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                controller: TextEditingController(
                    text: widget.isNew ? note : widget.selectedNote?.note),
                onChanged: (String value) {
                  note = value;
                },
                keyboardType: TextInputType.multiline,
                style: TextStyle(color: Color(kTextColors[selectedColorIndex])),
                minLines: 10,
                maxLines: null,
                decoration: kNoteInputFieldDecoration.copyWith(
                  fillColor:
                      Color(kTextColors[selectedColorIndex]).withOpacity(0.15),
                  errorText: errorTextNote,
                  errorStyle: TextStyle(
                      color: Color(kTextColors[selectedColorIndex]),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                'Select Color: ',
                style: kHintTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: getColorContainerList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: BottomButton(
                backgroundColor: kSecondaryColor,
                text: widget.isNew ? 'Add' : 'Update',
                onClick: () {
                  errorTextNote = '';
                  errorTextNote = '';
                  if (title.trim().isEmpty) {
                    setState(() {
                      errorTextTitle = 'Title cannot be empty';
                    });
                    return;
                  }
                  if (note.trim().isEmpty) {
                    setState(() {
                      errorTextNote = 'Note cannot be empty';
                    });
                    return;
                  }
                  Navigator.pop(context, {
                    "title": title,
                    "note": note,
                    "colorIndex": selectedColorIndex,
                    "date": dateToday,
                    "id": widget.selectedNote?.id,
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: BottomButton(
                backgroundColor: const Color(0xFFFA4454),
                text: widget.isNew ? 'Remove' : 'Delete',
                onClick: () {
                  Navigator.pop(context,
                      {"isDelete": true, "id": widget.selectedNote?.id});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
