import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/note_repository.dart';

part 'note_state.freezed.dart';

// Stan quizu - klasa domenowa implementująca immutability
@freezed
class NoteState with _$NoteState {
  const NoteState._();

  const factory NoteState({
    required String noteId,
    required String noteTitle,
    required String noteContent,
    required DateTime noteCreatedAt,
    required DateTime noteModifiedAt,
  }) = _NoteState;

  @override
  // TODO: implement noteContent
  String get noteContent => throw UnimplementedError();

  @override
  // TODO: implement noteCreatedAt
  DateTime get noteCreatedAt => throw UnimplementedError();

  @override
  // TODO: implement noteId
  String get noteId => throw UnimplementedError();

  @override
  // TODO: implement noteModifiedAt
  DateTime get noteModifiedAt => throw UnimplementedError();

  @override
  // TODO: implement noteTitle
  String get noteTitle => throw UnimplementedError();
}
