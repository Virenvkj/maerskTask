import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/presentation/state/notes_cubit.dart';
import 'package:notes/presentation/widgets/update_note_widget.dart';
import 'package:notes/presentation/widgets/notes_list_container.dart';

class NotesListScreen extends StatelessWidget {
  const NotesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UpdateNoteWidget(),
          ),
        ),
        child: const Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
            return NotesListContainer(
              notesList: state.activeNotes,
            );
          },
        ),
      ),
    );
  }
}
