import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_task_record.g.dart';

abstract class UserTaskRecord
    implements Built<UserTaskRecord, UserTaskRecordBuilder> {
  static Serializer<UserTaskRecord> get serializer =>
      _$userTaskRecordSerializer;

  String? get title;

  String? get description;

  LatLng? get location;

  DateTime? get datetime;

  int? get userLimit;

  DateTime? get createdDatetime;

  bool? get isJoinable;

  int? get scope;

  bool? get isCompleted;

  BuiltList<DocumentReference>? get userList;

  DocumentReference? get taskSubjectID;

  DocumentReference? get userID;

  int? get amountOfLikes;

  bool? get isLIked;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserTaskRecordBuilder builder) => builder
    ..title = ''
    ..description = ''
    ..userLimit = 0
    ..isJoinable = false
    ..scope = 0
    ..isCompleted = false
    ..userList = ListBuilder()
    ..amountOfLikes = 0
    ..isLIked = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userTask');

  static Stream<UserTaskRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserTaskRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserTaskRecord._();
  factory UserTaskRecord([void Function(UserTaskRecordBuilder) updates]) =
      _$UserTaskRecord;

  static UserTaskRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserTaskRecordData({
  String? title,
  String? description,
  LatLng? location,
  DateTime? datetime,
  int? userLimit,
  DateTime? createdDatetime,
  bool? isJoinable,
  int? scope,
  bool? isCompleted,
  DocumentReference? taskSubjectID,
  DocumentReference? userID,
  int? amountOfLikes,
  bool? isLIked,
}) {
  final firestoreData = serializers.toFirestore(
    UserTaskRecord.serializer,
    UserTaskRecord(
      (u) => u
        ..title = title
        ..description = description
        ..location = location
        ..datetime = datetime
        ..userLimit = userLimit
        ..createdDatetime = createdDatetime
        ..isJoinable = isJoinable
        ..scope = scope
        ..isCompleted = isCompleted
        ..userList = null
        ..taskSubjectID = taskSubjectID
        ..userID = userID
        ..amountOfLikes = amountOfLikes
        ..isLIked = isLIked,
    ),
  );

  return firestoreData;
}
