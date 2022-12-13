// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_comment_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TaskCommentRecord> _$taskCommentRecordSerializer =
    new _$TaskCommentRecordSerializer();

class _$TaskCommentRecordSerializer
    implements StructuredSerializer<TaskCommentRecord> {
  @override
  final Iterable<Type> types = const [TaskCommentRecord, _$TaskCommentRecord];
  @override
  final String wireName = 'TaskCommentRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TaskCommentRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.commentText;
    if (value != null) {
      result
        ..add('commentText')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdDatetime;
    if (value != null) {
      result
        ..add('createdDatetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userTaskID;
    if (value != null) {
      result
        ..add('userTaskID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userID;
    if (value != null) {
      result
        ..add('userID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  TaskCommentRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaskCommentRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'commentText':
          result.commentText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createdDatetime':
          result.createdDatetime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'userTaskID':
          result.userTaskID = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'userID':
          result.userID = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$TaskCommentRecord extends TaskCommentRecord {
  @override
  final String? commentText;
  @override
  final DateTime? createdDatetime;
  @override
  final DocumentReference<Object?>? userTaskID;
  @override
  final DocumentReference<Object?>? userID;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TaskCommentRecord(
          [void Function(TaskCommentRecordBuilder)? updates]) =>
      (new TaskCommentRecordBuilder()..update(updates))._build();

  _$TaskCommentRecord._(
      {this.commentText,
      this.createdDatetime,
      this.userTaskID,
      this.userID,
      this.ffRef})
      : super._();

  @override
  TaskCommentRecord rebuild(void Function(TaskCommentRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskCommentRecordBuilder toBuilder() =>
      new TaskCommentRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskCommentRecord &&
        commentText == other.commentText &&
        createdDatetime == other.createdDatetime &&
        userTaskID == other.userTaskID &&
        userID == other.userID &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, commentText.hashCode), createdDatetime.hashCode),
                userTaskID.hashCode),
            userID.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaskCommentRecord')
          ..add('commentText', commentText)
          ..add('createdDatetime', createdDatetime)
          ..add('userTaskID', userTaskID)
          ..add('userID', userID)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TaskCommentRecordBuilder
    implements Builder<TaskCommentRecord, TaskCommentRecordBuilder> {
  _$TaskCommentRecord? _$v;

  String? _commentText;
  String? get commentText => _$this._commentText;
  set commentText(String? commentText) => _$this._commentText = commentText;

  DateTime? _createdDatetime;
  DateTime? get createdDatetime => _$this._createdDatetime;
  set createdDatetime(DateTime? createdDatetime) =>
      _$this._createdDatetime = createdDatetime;

  DocumentReference<Object?>? _userTaskID;
  DocumentReference<Object?>? get userTaskID => _$this._userTaskID;
  set userTaskID(DocumentReference<Object?>? userTaskID) =>
      _$this._userTaskID = userTaskID;

  DocumentReference<Object?>? _userID;
  DocumentReference<Object?>? get userID => _$this._userID;
  set userID(DocumentReference<Object?>? userID) => _$this._userID = userID;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TaskCommentRecordBuilder() {
    TaskCommentRecord._initializeBuilder(this);
  }

  TaskCommentRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _commentText = $v.commentText;
      _createdDatetime = $v.createdDatetime;
      _userTaskID = $v.userTaskID;
      _userID = $v.userID;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskCommentRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskCommentRecord;
  }

  @override
  void update(void Function(TaskCommentRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskCommentRecord build() => _build();

  _$TaskCommentRecord _build() {
    final _$result = _$v ??
        new _$TaskCommentRecord._(
            commentText: commentText,
            createdDatetime: createdDatetime,
            userTaskID: userTaskID,
            userID: userID,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
