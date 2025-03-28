// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NoteState {

 String get noteId; String get noteTitle; String get noteContent; DateTime get noteCreatedAt; DateTime get noteModifiedAt;
/// Create a copy of NoteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteStateCopyWith<NoteState> get copyWith => _$NoteStateCopyWithImpl<NoteState>(this as NoteState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteState&&(identical(other.noteId, noteId) || other.noteId == noteId)&&(identical(other.noteTitle, noteTitle) || other.noteTitle == noteTitle)&&(identical(other.noteContent, noteContent) || other.noteContent == noteContent)&&(identical(other.noteCreatedAt, noteCreatedAt) || other.noteCreatedAt == noteCreatedAt)&&(identical(other.noteModifiedAt, noteModifiedAt) || other.noteModifiedAt == noteModifiedAt));
}


@override
int get hashCode => Object.hash(runtimeType,noteId,noteTitle,noteContent,noteCreatedAt,noteModifiedAt);

@override
String toString() {
  return 'NoteState(noteId: $noteId, noteTitle: $noteTitle, noteContent: $noteContent, noteCreatedAt: $noteCreatedAt, noteModifiedAt: $noteModifiedAt)';
}


}

/// @nodoc
abstract mixin class $NoteStateCopyWith<$Res>  {
  factory $NoteStateCopyWith(NoteState value, $Res Function(NoteState) _then) = _$NoteStateCopyWithImpl;
@useResult
$Res call({
 String noteId, String noteTitle, String noteContent, DateTime noteCreatedAt, DateTime noteModifiedAt
});




}
/// @nodoc
class _$NoteStateCopyWithImpl<$Res>
    implements $NoteStateCopyWith<$Res> {
  _$NoteStateCopyWithImpl(this._self, this._then);

  final NoteState _self;
  final $Res Function(NoteState) _then;

/// Create a copy of NoteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? noteId = null,Object? noteTitle = null,Object? noteContent = null,Object? noteCreatedAt = null,Object? noteModifiedAt = null,}) {
  return _then(_self.copyWith(
noteId: null == noteId ? _self.noteId : noteId // ignore: cast_nullable_to_non_nullable
as String,noteTitle: null == noteTitle ? _self.noteTitle : noteTitle // ignore: cast_nullable_to_non_nullable
as String,noteContent: null == noteContent ? _self.noteContent : noteContent // ignore: cast_nullable_to_non_nullable
as String,noteCreatedAt: null == noteCreatedAt ? _self.noteCreatedAt : noteCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,noteModifiedAt: null == noteModifiedAt ? _self.noteModifiedAt : noteModifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc


class _NoteState extends NoteState {
  const _NoteState({required this.noteId, required this.noteTitle, required this.noteContent, required this.noteCreatedAt, required this.noteModifiedAt}): super._();
  

@override final  String noteId;
@override final  String noteTitle;
@override final  String noteContent;
@override final  DateTime noteCreatedAt;
@override final  DateTime noteModifiedAt;

/// Create a copy of NoteState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteStateCopyWith<_NoteState> get copyWith => __$NoteStateCopyWithImpl<_NoteState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoteState&&(identical(other.noteId, noteId) || other.noteId == noteId)&&(identical(other.noteTitle, noteTitle) || other.noteTitle == noteTitle)&&(identical(other.noteContent, noteContent) || other.noteContent == noteContent)&&(identical(other.noteCreatedAt, noteCreatedAt) || other.noteCreatedAt == noteCreatedAt)&&(identical(other.noteModifiedAt, noteModifiedAt) || other.noteModifiedAt == noteModifiedAt));
}


@override
int get hashCode => Object.hash(runtimeType,noteId,noteTitle,noteContent,noteCreatedAt,noteModifiedAt);

@override
String toString() {
  return 'NoteState(noteId: $noteId, noteTitle: $noteTitle, noteContent: $noteContent, noteCreatedAt: $noteCreatedAt, noteModifiedAt: $noteModifiedAt)';
}


}

/// @nodoc
abstract mixin class _$NoteStateCopyWith<$Res> implements $NoteStateCopyWith<$Res> {
  factory _$NoteStateCopyWith(_NoteState value, $Res Function(_NoteState) _then) = __$NoteStateCopyWithImpl;
@override @useResult
$Res call({
 String noteId, String noteTitle, String noteContent, DateTime noteCreatedAt, DateTime noteModifiedAt
});




}
/// @nodoc
class __$NoteStateCopyWithImpl<$Res>
    implements _$NoteStateCopyWith<$Res> {
  __$NoteStateCopyWithImpl(this._self, this._then);

  final _NoteState _self;
  final $Res Function(_NoteState) _then;

/// Create a copy of NoteState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? noteId = null,Object? noteTitle = null,Object? noteContent = null,Object? noteCreatedAt = null,Object? noteModifiedAt = null,}) {
  return _then(_NoteState(
noteId: null == noteId ? _self.noteId : noteId // ignore: cast_nullable_to_non_nullable
as String,noteTitle: null == noteTitle ? _self.noteTitle : noteTitle // ignore: cast_nullable_to_non_nullable
as String,noteContent: null == noteContent ? _self.noteContent : noteContent // ignore: cast_nullable_to_non_nullable
as String,noteCreatedAt: null == noteCreatedAt ? _self.noteCreatedAt : noteCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,noteModifiedAt: null == noteModifiedAt ? _self.noteModifiedAt : noteModifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
