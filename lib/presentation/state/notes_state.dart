part of 'notes_cubit.dart';

@freezed
class NotesState with _$NotesState {
  const factory NotesState({
    required List<Note> activeNotes,
  }) = _NotesState;

  factory NotesState.initial() => const NotesState(activeNotes: []);
}
