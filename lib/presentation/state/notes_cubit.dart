import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/domain/note/note.dart';
import 'package:notes/domain/review_interval.dart';

part 'notes_state.dart';
part 'notes_cubit.freezed.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit(super.initialState);

  void addNewNote({required Note noteDetails}) {
    List<Note> currentNotes = state.activeNotes.toList(growable: true);
    currentNotes.add(noteDetails);

    emit(
      state.copyWith(activeNotes: currentNotes),
    );
  }

  void updateNoteDetails({
    required String noteId,
    String? title,
    String? description,
    DateTime? createdDate,
    DateTime? lastModifiedDate,
    ReviewInterval? reviewInterval,
  }) {
    final currentNoteIndex =
        state.activeNotes.indexWhere((note) => (note.id == noteId));

    final currentNote = state.activeNotes[currentNoteIndex];

    final updatedNote = state.activeNotes[currentNoteIndex].copyWith(
      title: title ?? currentNote.title,
      description: description ?? currentNote.description,
      lastModifiedDate: lastModifiedDate ?? currentNote.lastModifiedDate,
      reviewInterval: reviewInterval ?? currentNote.reviewInterval,
    );

    final activeNotes = state.activeNotes;
    activeNotes[currentNoteIndex] = updatedNote;

    emit(
      state.copyWith(activeNotes: activeNotes),
    );
  }
}
