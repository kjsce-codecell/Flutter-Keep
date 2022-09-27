import 'package:flutter/material.dart';
import 'package:flutterkeep/constants.dart';
import 'package:flutterkeep/widgets/bottom_button.dart';
import 'package:flutterkeep/widgets/color_container.dart';

class EditNote extends StatefulWidget {
  bool isNew;
  EditNote({super.key, required this.isNew});
  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  String title = '';
  String note = '';
  String dateToday = DateTime.now().toString().substring(0, 10);
  int selectedColorIndex = 0; // Default background color selected for note.
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
                style: TextStyle(color: Color(kTextColors[selectedColorIndex])),
                decoration: kInputFieldDecoration,
                onChanged: (value) {
                  title = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                onChanged: (String value) {
                  note = value;
                },
                keyboardType: TextInputType.multiline,
                style: TextStyle(color: Color(kTextColors[selectedColorIndex])),
                minLines: 10,
                maxLines: null,
                decoration: kNoteInputFieldDecoration,
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
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: kSecondaryColor,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
                child: BottomButton(
                  text: widget.isNew ? 'Add' : 'Update',
                  onClick: () {
                    Navigator.pop(context, {
                      "title": title,
                      "note": note,
                      "colorIndex": selectedColorIndex,
                      "date": dateToday
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
