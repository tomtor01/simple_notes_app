import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_state.freezed.dart';

// Stan notatki - klasa domenowa implementująca immutability
@freezed
abstract class NoteState with _$NoteState {
  const NoteState._();

  const factory NoteState({
    required String noteId,
    required String noteTitle,
    required String noteContent,
    required DateTime noteCreatedAt,
    required DateTime noteModifiedAt,
  }) = _NoteState;
}
