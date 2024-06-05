import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes/domain/review_interval.dart';
part 'note.freezed.dart';

@freezed
class Note with _$Note {
  const factory Note({
    required String id,
    required String title,
    required String description,
    required DateTime lastModifiedDate,
    required ReviewInterval reviewInterval,
  }) = _Note;
}
