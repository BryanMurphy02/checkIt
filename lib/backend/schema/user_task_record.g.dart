// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_task_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserTaskRecord> _$userTaskRecordSerializer =
    new _$UserTaskRecordSerializer();

class _$UserTaskRecordSerializer
    implements StructuredSerializer<UserTaskRecord> {
  @override
  final Iterable<Type> types = const [UserTaskRecord, _$UserTaskRecord];
  @override
  final String wireName = 'UserTaskRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserTaskRecord object,
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
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.datetime;
    if (value != null) {
      result
        ..add('datetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userLimit;
    if (value != null) {
      result
        ..add('userLimit')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.createdDatetime;
    if (value != null) {
      result
        ..add('createdDatetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.isJoinable;
    if (value != null) {
      result
        ..add('isJoinable')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.scope;
    if (value != null) {
      result
        ..add('scope')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isCompleted;
    if (value != null) {
      result
        ..add('isCompleted')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.userList;
    if (value != null) {
      result
        ..add('userList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.taskSubjectID;
    if (value != null) {
      result
        ..add('taskSubjectID')
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
    value = object.amountOfLikes;
    if (value != null) {
      result
        ..add('amountOfLikes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isLIked;
    if (value != null) {
      result
        ..add('isLIked')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  UserTaskRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserTaskRecordBuilder();

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
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'datetime':
          result.datetime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'userLimit':
          result.userLimit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'createdDatetime':
          result.createdDatetime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'isJoinable':
          result.isJoinable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'scope':
          result.scope = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'isCompleted':
          result.isCompleted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'userList':
          result.userList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'taskSubjectID':
          result.taskSubjectID = serializers.deserialize(value,
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
        case 'amountOfLikes':
          result.amountOfLikes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'isLIked':
          result.isLIked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$UserTaskRecord extends UserTaskRecord {
  @override
  final String? title;
  @override
  final String? description;
  @override
  final LatLng? location;
  @override
  final DateTime? datetime;
  @override
  final int? userLimit;
  @override
  final DateTime? createdDatetime;
  @override
  final bool? isJoinable;
  @override
  final int? scope;
  @override
  final bool? isCompleted;
  @override
  final BuiltList<DocumentReference<Object?>>? userList;
  @override
  final DocumentReference<Object?>? taskSubjectID;
  @override
  final DocumentReference<Object?>? userID;
  @override
  final int? amountOfLikes;
  @override
  final bool? isLIked;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserTaskRecord([void Function(UserTaskRecordBuilder)? updates]) =>
      (new UserTaskRecordBuilder()..update(updates))._build();

  _$UserTaskRecord._(
      {this.title,
      this.description,
      this.location,
      this.datetime,
      this.userLimit,
      this.createdDatetime,
      this.isJoinable,
      this.scope,
      this.isCompleted,
      this.userList,
      this.taskSubjectID,
      this.userID,
      this.amountOfLikes,
      this.isLIked,
      this.ffRef})
      : super._();

  @override
  UserTaskRecord rebuild(void Function(UserTaskRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserTaskRecordBuilder toBuilder() =>
      new UserTaskRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserTaskRecord &&
        title == other.title &&
        description == other.description &&
        location == other.location &&
        datetime == other.datetime &&
        userLimit == other.userLimit &&
        createdDatetime == other.createdDatetime &&
        isJoinable == other.isJoinable &&
        scope == other.scope &&
        isCompleted == other.isCompleted &&
        userList == other.userList &&
        taskSubjectID == other.taskSubjectID &&
        userID == other.userID &&
        amountOfLikes == other.amountOfLikes &&
        isLIked == other.isLIked &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(0,
                                                                title.hashCode),
                                                            description
                                                                .hashCode),
                                                        location.hashCode),
                                                    datetime.hashCode),
                                                userLimit.hashCode),
                                            createdDatetime.hashCode),
                                        isJoinable.hashCode),
                                    scope.hashCode),
                                isCompleted.hashCode),
                            userList.hashCode),
                        taskSubjectID.hashCode),
                    userID.hashCode),
                amountOfLikes.hashCode),
            isLIked.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserTaskRecord')
          ..add('title', title)
          ..add('description', description)
          ..add('location', location)
          ..add('datetime', datetime)
          ..add('userLimit', userLimit)
          ..add('createdDatetime', createdDatetime)
          ..add('isJoinable', isJoinable)
          ..add('scope', scope)
          ..add('isCompleted', isCompleted)
          ..add('userList', userList)
          ..add('taskSubjectID', taskSubjectID)
          ..add('userID', userID)
          ..add('amountOfLikes', amountOfLikes)
          ..add('isLIked', isLIked)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserTaskRecordBuilder
    implements Builder<UserTaskRecord, UserTaskRecordBuilder> {
  _$UserTaskRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  DateTime? _datetime;
  DateTime? get datetime => _$this._datetime;
  set datetime(DateTime? datetime) => _$this._datetime = datetime;

  int? _userLimit;
  int? get userLimit => _$this._userLimit;
  set userLimit(int? userLimit) => _$this._userLimit = userLimit;

  DateTime? _createdDatetime;
  DateTime? get createdDatetime => _$this._createdDatetime;
  set createdDatetime(DateTime? createdDatetime) =>
      _$this._createdDatetime = createdDatetime;

  bool? _isJoinable;
  bool? get isJoinable => _$this._isJoinable;
  set isJoinable(bool? isJoinable) => _$this._isJoinable = isJoinable;

  int? _scope;
  int? get scope => _$this._scope;
  set scope(int? scope) => _$this._scope = scope;

  bool? _isCompleted;
  bool? get isCompleted => _$this._isCompleted;
  set isCompleted(bool? isCompleted) => _$this._isCompleted = isCompleted;

  ListBuilder<DocumentReference<Object?>>? _userList;
  ListBuilder<DocumentReference<Object?>> get userList =>
      _$this._userList ??= new ListBuilder<DocumentReference<Object?>>();
  set userList(ListBuilder<DocumentReference<Object?>>? userList) =>
      _$this._userList = userList;

  DocumentReference<Object?>? _taskSubjectID;
  DocumentReference<Object?>? get taskSubjectID => _$this._taskSubjectID;
  set taskSubjectID(DocumentReference<Object?>? taskSubjectID) =>
      _$this._taskSubjectID = taskSubjectID;

  DocumentReference<Object?>? _userID;
  DocumentReference<Object?>? get userID => _$this._userID;
  set userID(DocumentReference<Object?>? userID) => _$this._userID = userID;

  int? _amountOfLikes;
  int? get amountOfLikes => _$this._amountOfLikes;
  set amountOfLikes(int? amountOfLikes) =>
      _$this._amountOfLikes = amountOfLikes;

  bool? _isLIked;
  bool? get isLIked => _$this._isLIked;
  set isLIked(bool? isLIked) => _$this._isLIked = isLIked;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserTaskRecordBuilder() {
    UserTaskRecord._initializeBuilder(this);
  }

  UserTaskRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _location = $v.location;
      _datetime = $v.datetime;
      _userLimit = $v.userLimit;
      _createdDatetime = $v.createdDatetime;
      _isJoinable = $v.isJoinable;
      _scope = $v.scope;
      _isCompleted = $v.isCompleted;
      _userList = $v.userList?.toBuilder();
      _taskSubjectID = $v.taskSubjectID;
      _userID = $v.userID;
      _amountOfLikes = $v.amountOfLikes;
      _isLIked = $v.isLIked;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserTaskRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserTaskRecord;
  }

  @override
  void update(void Function(UserTaskRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserTaskRecord build() => _build();

  _$UserTaskRecord _build() {
    _$UserTaskRecord _$result;
    try {
      _$result = _$v ??
          new _$UserTaskRecord._(
              title: title,
              description: description,
              location: location,
              datetime: datetime,
              userLimit: userLimit,
              createdDatetime: createdDatetime,
              isJoinable: isJoinable,
              scope: scope,
              isCompleted: isCompleted,
              userList: _userList?.build(),
              taskSubjectID: taskSubjectID,
              userID: userID,
              amountOfLikes: amountOfLikes,
              isLIked: isLIked,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userList';
        _userList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserTaskRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
