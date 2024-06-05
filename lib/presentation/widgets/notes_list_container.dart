import 'package:flutter/material.dart';
import 'package:notes/domain/note/note.dart';
import 'package:notes/domain/review_interval.dart';
import 'package:notes/presentation/widgets/update_note_widget.dart';

class NotesListContainer extends StatelessWidget {
  const NotesListContainer({
    super.key,
    required this.notesList,
  });

  final List<Note> notesList;

  @override
  Widget build(BuildContext context) {
    return (notesList.isEmpty)
        ? const Center(
            child: Text('Create your first note !'),
          )
        : ListView.builder(
            itemCount: notesList.length,
            itemBuilder: (context, index) {
              final note = notesList[index];
              final showReminder = DateTime.now()
                  .subtract(
                    ReviewInterval.intervalDuration(note.reviewInterval),
                  )
                  .isAfter(note.lastModifiedDate);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showReminder)
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.red[200],
                      child: const Text("time to review the note !"),
                    ),
                  ListTile(
                    title: Text(note.title),
                    subtitle: Text(note.description),
                    trailing: IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateNoteWidget(note: note),
                        ),
                      ),
                      icon: const Icon(Icons.edit),
                    ),
                  ),
                  const Divider(),
                ],
              );
            },
          );
  }
}
