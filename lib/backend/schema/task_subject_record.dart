import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'task_subject_record.g.dart';

abstract class TaskSubjectRecord
    implements Built<TaskSubjectRecord, TaskSubjectRecordBuilder> {
  static Serializer<TaskSubjectRecord> get serializer =>
      _$taskSubjectRecordSerializer;

  String? get title;

  DateTime? get createdDatetime;

  bool? get isGroup;

  BuiltList<DocumentReference>? get subjectMemberList;

  DocumentReference? get creatorID;

  String? get taskSubjectID;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TaskSubjectRecordBuilder builder) => builder
    ..title = ''
    ..isGroup = false
    ..subjectMemberList = ListBuilder()
    ..taskSubjectID = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('taskSubject');

  static Stream<TaskSubjectRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TaskSubjectRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TaskSubjectRecord._();
  factory TaskSubjectRecord([void Function(TaskSubjectRecordBuilder) updates]) =
      _$TaskSubjectRecord;

  static TaskSubjectRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTaskSubjectRecordData({
  String? title,
  DateTime? createdDatetime,
  bool? isGroup,
  DocumentReference? creatorID,
  String? taskSubjectID,
}) {
  final firestoreData = serializers.toFirestore(
    TaskSubjectRecord.serializer,
    TaskSubjectRecord(
      (t) => t
        ..title = title
        ..createdDatetime = createdDatetime
        ..isGroup = isGroup
        ..subjectMemberList = null
        ..creatorID = creatorID
        ..taskSubjectID = taskSubjectID,
    ),
  );

  return firestoreData;
}
