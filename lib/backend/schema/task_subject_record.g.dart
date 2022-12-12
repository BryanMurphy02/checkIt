// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_subject_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TaskSubjectRecord> _$taskSubjectRecordSerializer =
    new _$TaskSubjectRecordSerializer();

class _$TaskSubjectRecordSerializer
    implements StructuredSerializer<TaskSubjectRecord> {
  @override
  final Iterable<Type> types = const [TaskSubjectRecord, _$TaskSubjectRecord];
  @override
  final String wireName = 'TaskSubjectRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TaskSubjectRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
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
    value = object.isGroup;
    if (value != null) {
      result
        ..add('isGroup')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.subjectMemberList;
    if (value != null) {
      result
        ..add('subjectMemberList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.creatorID;
    if (value != null) {
      result
        ..add('creatorID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.taskSubjectID;
    if (value != null) {
      result
        ..add('taskSubjectID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  TaskSubjectRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaskSubjectRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createdDatetime':
          result.createdDatetime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'isGroup':
          result.isGroup = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'subjectMemberList':
          result.subjectMemberList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'creatorID':
          result.creatorID = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'taskSubjectID':
          result.taskSubjectID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$TaskSubjectRecord extends TaskSubjectRecord {
  @override
  final String? title;
  @override
  final DateTime? createdDatetime;
  @override
  final bool? isGroup;
  @override
  final BuiltList<DocumentReference<Object?>>? subjectMemberList;
  @override
  final DocumentReference<Object?>? creatorID;
  @override
  final String? taskSubjectID;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TaskSubjectRecord(
          [void Function(TaskSubjectRecordBuilder)? updates]) =>
      (new TaskSubjectRecordBuilder()..update(updates))._build();

  _$TaskSubjectRecord._(
      {this.title,
      this.createdDatetime,
      this.isGroup,
      this.subjectMemberList,
      this.creatorID,
      this.taskSubjectID,
      this.ffRef})
      : super._();

  @override
  TaskSubjectRecord rebuild(void Function(TaskSubjectRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskSubjectRecordBuilder toBuilder() =>
      new TaskSubjectRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskSubjectRecord &&
        title == other.title &&
        createdDatetime == other.createdDatetime &&
        isGroup == other.isGroup &&
        subjectMemberList == other.subjectMemberList &&
        creatorID == other.creatorID &&
        taskSubjectID == other.taskSubjectID &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, title.hashCode), createdDatetime.hashCode),
                        isGroup.hashCode),
                    subjectMemberList.hashCode),
                creatorID.hashCode),
            taskSubjectID.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaskSubjectRecord')
          ..add('title', title)
          ..add('createdDatetime', createdDatetime)
          ..add('isGroup', isGroup)
          ..add('subjectMemberList', subjectMemberList)
          ..add('creatorID', creatorID)
          ..add('taskSubjectID', taskSubjectID)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TaskSubjectRecordBuilder
    implements Builder<TaskSubjectRecord, TaskSubjectRecordBuilder> {
  _$TaskSubjectRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  DateTime? _createdDatetime;
  DateTime? get createdDatetime => _$this._createdDatetime;
  set createdDatetime(DateTime? createdDatetime) =>
      _$this._createdDatetime = createdDatetime;

  bool? _isGroup;
  bool? get isGroup => _$this._isGroup;
  set isGroup(bool? isGroup) => _$this._isGroup = isGroup;

  ListBuilder<DocumentReference<Object?>>? _subjectMemberList;
  ListBuilder<DocumentReference<Object?>> get subjectMemberList =>
      _$this._subjectMemberList ??=
          new ListBuilder<DocumentReference<Object?>>();
  set subjectMemberList(
          ListBuilder<DocumentReference<Object?>>? subjectMemberList) =>
      _$this._subjectMemberList = subjectMemberList;

  DocumentReference<Object?>? _creatorID;
  DocumentReference<Object?>? get creatorID => _$this._creatorID;
  set creatorID(DocumentReference<Object?>? creatorID) =>
      _$this._creatorID = creatorID;

  String? _taskSubjectID;
  String? get taskSubjectID => _$this._taskSubjectID;
  set taskSubjectID(String? taskSubjectID) =>
      _$this._taskSubjectID = taskSubjectID;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TaskSubjectRecordBuilder() {
    TaskSubjectRecord._initializeBuilder(this);
  }

  TaskSubjectRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _createdDatetime = $v.createdDatetime;
      _isGroup = $v.isGroup;
      _subjectMemberList = $v.subjectMemberList?.toBuilder();
      _creatorID = $v.creatorID;
      _taskSubjectID = $v.taskSubjectID;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskSubjectRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskSubjectRecord;
  }

  @override
  void update(void Function(TaskSubjectRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskSubjectRecord build() => _build();

  _$TaskSubjectRecord _build() {
    _$TaskSubjectRecord _$result;
    try {
      _$result = _$v ??
          new _$TaskSubjectRecord._(
              title: title,
              createdDatetime: createdDatetime,
              isGroup: isGroup,
              subjectMemberList: _subjectMemberList?.build(),
              creatorID: creatorID,
              taskSubjectID: taskSubjectID,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'subjectMemberList';
        _subjectMemberList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TaskSubjectRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
