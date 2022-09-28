import 'note.dart';

class NoteManager {
  List<Note> notesList = [
    //  Testing purpose adding default notes
    Note(
        title: "This is notes from Lecture XYZ",
        note:
            "A lecture is a teaching method used in many colleges and universities around the world. It's an efficient way to transmit information to a large number of students. However, many students complain that their professors' lectures are boring. Others find lectures difficult to follow because the topics are too technical. If you find a lecture boring, disengaged or difficult to follow, here are some suggestions for making it better. \n A lecture is an important learning tool for college students. Most college courses involve reading lengthy books on complicated topics. Lectures help students learn essential information at a faster rate by breaking down complex topics into smaller pieces. Students also learn better when they're engaged in the material; a boring lecture will only makes them less attentive. Additionally, some professors approach their lectures enthusiastically- whereas others come off as dour old grumpskulls. This can seriously dampen a student's enthusiasm for the material. If you don't like a professor's style, it's best to sit tight and wait until he switches gears before joining the class.",
        date: "25/9/2022",
        id: 1,
        backgroundColor: 0xFFFFFFFF,
        textColor: 0xFF000000),
    Note(
      id: 2,
      title: "Why is Open Source important?",
      backgroundColor: 0xFF000000,
      textColor: 0xFFFFFFFF,
      note:
          "Open source software is an increasingly popular model for developing and distributing computer programs. It takes advantage of the growing economies of scale in information technology and manufacturing and encourages participation from both developers and end users. Developed primarily in the late 1990s, open source has many advantages over its proprietary counterpart. \nCompared to proprietary software, open source software is significantly less expensive to develop- in part because it lacks the expensive licensing fees proprietary firms charge for their programs. However, if the program is open sourced, the development team can often find outside contributors who are willing to work for free. This allows the development team to focus on making the program instead of paying them to work on it. Furthermore, when a program is open sourced, developers from all over the world can contribute to its codebase with improvements. This leads to much better software with greater functionality than could be produced by a single team of developers working in-house.\nAdditionally, an open source program's source code is easily accessible to programmers and tech enthusiasts alike. This allows programmers to modify the code to suit individual needs or solve unique problems without seeking approval from the original author- a process referred to as customization. Proprietary software developers have little incentive to make customizations easy because that would cut into their profits by allowing users to modify their programs without approval. Modifications made by programmers without approval are generally referred to as third-party extensions or add-ons and are very difficult to troubleshoot or remove from a program's codebase. \nBecause modifications are easy with open source, developers do not need to worry about losing any intellectual property when transferring a program from a proprietary environment. In most cases, the original authors retain all rights to their programs' code and settings without concern of any lost intellectual property. Instead, they can focus on writing new features for their software and releasing them freely under the open source license. This allows anyone access to the source code, which they can modify as they see fit- resulting in an even better product. \nBased on these considerations, it makes sense why so many people are abandoning closed environment models in favor of open source this era. The development environment is much less complicated and expensive than proprietary software, customization is easy since source code is available, and no intellectual property is lost in transferring from a proprietary to an open source model.",
      date: "25/9/2022",
    ),
    Note(
      id: 3,
      title: "Future of Programming",
      backgroundColor: 0xFFFFFFFF,
      textColor: 0xFF000000,
      note:
          "Programming is one of the most popular fields in the tech industry. Many people like to learn programming because it's a way to express your creativity and make something out of nothing. Programming languages are also easy to learn and use. However, programming isn't going anywhere; it's only getting easier to use. \nProgramming has become so natural that we don't even think about using code anymore. Most of us take for granted the power of coding. For example, many people love using their smartphones and other gadgets they programmed themselves. The idea of not having access to code would seem crazy to someone 50 years ago. This is because programming has been so readily available for so long that we've become acclimated to it. We no longer think about programming when using our phones or other gadgets. \nPeople have a wide variety of ways to learn programming languages. There are tons of online courses, books, and other teaching tools available. Even schools are starting to understand how powerful programming is. Plus, companies are starting to understand how many talented programmers there are worldwide. They're adapting by increasing pay and benefits for programmers, opening offices in rural areas, and more. Programming is becoming a respected field regardless of socioeconomic standing. \nProgramming is becoming easier for novices thanks to technology and open-source projects. Developers use programs like Python and Ruby on Rails as starting points for new projects. These projects help novices learn the ins and outs of web development through sample code and tutorials. This way anyone can learn how to develop websites using simple programming languages like HTML, CSS, JavaScript and more! This is fantastic news for everyone who wants to learn programming! \nProgramming is one of the most popular fields in the tech industry because it's so easy to use and creative. There are many ways to learn programming, and it's becoming much easier thanks to technology and open-source projects. Programming is going nowhere; it's only getting easier and more popular with time!",
      date: "26/9/2022",
    ),
    Note(
      id: 4,
      title: "What is replacement for Lorem Ipsum for Devlopers?",
      backgroundColor: 0xFF98fb98,
      textColor: 0xFF000000,
      note:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
      date: "25/9/2022",
    )
  ];

  void addNewNote(
      {required String title,
      required String note,
      required int backgroundColor,
      required int textColor,
      required String date}) {
    notesList.add(Note(
      title: title,
      note: note,
      date: date,
      id: (notesList.length + 1),
      textColor: textColor,
      backgroundColor: backgroundColor,
    ));
  }

  Note? getNoteFromId(int noteId) {
    for (var note in notesList) {
      if (note.id == noteId) return note;
    }
    return null;
  }

  void upateNoteFromId(
      {required String title,
      required String note,
      required int backgroundColor,
      required int textColor,
      required String date,
      required int id}) {
    for (var currentNote in notesList) {
      if (currentNote.id == id) {
        currentNote.title = title;
        currentNote.note = note;
        currentNote.date = date;
        currentNote.backgroundColor = backgroundColor;
        currentNote.textColor = textColor;
        return;
      }
    }
  }

  void deleteNoteFromId(int noteId) {
    for (int index = 0; index < notesList.length; index++) {
      if (notesList[index].id == noteId) notesList.removeAt(index);
    }
    return;
  }
}
