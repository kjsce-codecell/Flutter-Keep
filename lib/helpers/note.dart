import 'dart:convert';

class Note {
  final String title;
  final String note;
  final String date;
  final int? id;
  final int textColor;
  final int backgroundColor;
  Note(
      {required this.title,
      required this.note,
      required this.date,
      this.id,
      required this.textColor,
      required this.backgroundColor});
  static Note fromMap(Map<String, Object?> map) => Note(
        id: map['_id'] as int?,
        title: map['title'] as String,
        note: map['note'] as String,
        date: map['date'] as String,
        backgroundColor: map['backgroundColor'] as int,
        textColor: map['textColor'] as int,
      );
  Map<String, Object?> toMap() {
    return {
      "_id": id,
      "title": title,
      "note": note,
      "date": date,
      "textColor": textColor,
      "backgroundColor": backgroundColor
    };
  }

  Note copy(
          {String? title_,
          String? note_,
          String? date_,
          int? id_,
          int? textColor_,
          int? backgroundColor_}) =>
      Note(
          title: title_ ?? title,
          note: note_ ?? note,
          date: date_ ?? date,
          textColor: textColor_ ?? textColor,
          backgroundColor: backgroundColor_ ?? backgroundColor);
}
