// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_like_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TaskLikeRecord> _$taskLikeRecordSerializer =
    new _$TaskLikeRecordSerializer();

class _$TaskLikeRecordSerializer
    implements StructuredSerializer<TaskLikeRecord> {
  @override
  final Iterable<Type> types = const [TaskLikeRecord, _$TaskLikeRecord];
  @override
  final String wireName = 'TaskLikeRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TaskLikeRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createdDatetime;
    if (value != null) {
      result
        ..add('createdDatetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userID;
    if (value != null) {
      result
        ..add('userID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userTaskID;
    if (value != null) {
      result
        ..add('userTaskID')
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
  TaskLikeRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaskLikeRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'createdDatetime':
          result.createdDatetime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'userID':
          result.userID = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'userTaskID':
          result.userTaskID = serializers.deserialize(value,
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

class _$TaskLikeRecord extends TaskLikeRecord {
  @override
  final DateTime? createdDatetime;
  @override
  final DocumentReference<Object?>? userID;
  @override
  final DocumentReference<Object?>? userTaskID;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TaskLikeRecord([void Function(TaskLikeRecordBuilder)? updates]) =>
      (new TaskLikeRecordBuilder()..update(updates))._build();

  _$TaskLikeRecord._(
      {this.createdDatetime, this.userID, this.userTaskID, this.ffRef})
      : super._();

  @override
  TaskLikeRecord rebuild(void Function(TaskLikeRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskLikeRecordBuilder toBuilder() =>
      new TaskLikeRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskLikeRecord &&
        createdDatetime == other.createdDatetime &&
        userID == other.userID &&
        userTaskID == other.userTaskID &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, createdDatetime.hashCode), userID.hashCode),
            userTaskID.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaskLikeRecord')
          ..add('createdDatetime', createdDatetime)
          ..add('userID', userID)
          ..add('userTaskID', userTaskID)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TaskLikeRecordBuilder
    implements Builder<TaskLikeRecord, TaskLikeRecordBuilder> {
  _$TaskLikeRecord? _$v;

  DateTime? _createdDatetime;
  DateTime? get createdDatetime => _$this._createdDatetime;
  set createdDatetime(DateTime? createdDatetime) =>
      _$this._createdDatetime = createdDatetime;

  DocumentReference<Object?>? _userID;
  DocumentReference<Object?>? get userID => _$this._userID;
  set userID(DocumentReference<Object?>? userID) => _$this._userID = userID;

  DocumentReference<Object?>? _userTaskID;
  DocumentReference<Object?>? get userTaskID => _$this._userTaskID;
  set userTaskID(DocumentReference<Object?>? userTaskID) =>
      _$this._userTaskID = userTaskID;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TaskLikeRecordBuilder() {
    TaskLikeRecord._initializeBuilder(this);
  }

  TaskLikeRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdDatetime = $v.createdDatetime;
      _userID = $v.userID;
      _userTaskID = $v.userTaskID;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskLikeRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskLikeRecord;
  }

  @override
  void update(void Function(TaskLikeRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskLikeRecord build() => _build();

  _$TaskLikeRecord _build() {
    final _$result = _$v ??
        new _$TaskLikeRecord._(
            createdDatetime: createdDatetime,
            userID: userID,
            userTaskID: userTaskID,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
