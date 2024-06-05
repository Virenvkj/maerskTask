import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/domain/note/note.dart';
import 'package:notes/domain/review_interval.dart';
import 'package:notes/presentation/state/notes_cubit.dart';
import 'package:uuid/uuid.dart';

class UpdateNoteWidget extends StatefulWidget {
  const UpdateNoteWidget({super.key, this.note});

  final Note? note;

  @override
  State<UpdateNoteWidget> createState() => _UpdateNoteWidgetState();
}

class _UpdateNoteWidgetState extends State<UpdateNoteWidget> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  final uidGenerator = const Uuid();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _descriptionController =
        TextEditingController(text: widget.note?.description ?? '');
  }

  void _saveNote() {
    if (widget.note != null) {
      context.read<NotesCubit>().updateNoteDetails(
            noteId: widget.note!.id,
            title: _titleController.text,
            description: _descriptionController.text,
            lastModifiedDate: DateTime.now(),
          );
    } else {
      context.read<NotesCubit>().addNewNote(
            noteDetails: Note(
              id: uidGenerator.v1(),
              title: _titleController.text,
              description: _descriptionController.text,
              lastModifiedDate: DateTime.now(),
              reviewInterval: ReviewInterval.short,
            ),
          );
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text("Enter note details"),
              const SizedBox(height: 20),
              TextFormField(
                key: const Key("titleField"),
                keyboardType: TextInputType.text,
                controller: _titleController,
                decoration: const InputDecoration(hintText: "Enter title"),
              ),
              TextFormField(
                key: const Key("descriptionField"),
                keyboardType: TextInputType.text,
                controller: _descriptionController,
                decoration:
                    const InputDecoration(hintText: "Enter description"),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: _saveNote,
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
