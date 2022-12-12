import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'task_comment_record.g.dart';

abstract class TaskCommentRecord
    implements Built<TaskCommentRecord, TaskCommentRecordBuilder> {
  static Serializer<TaskCommentRecord> get serializer =>
      _$taskCommentRecordSerializer;

  String? get taskCommentID;

  String? get commentText;

  DateTime? get createdDatetime;

  DocumentReference? get userTaskID;

  DocumentReference? get userID;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TaskCommentRecordBuilder builder) => builder
    ..taskCommentID = ''
    ..commentText = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('taskComment');

  static Stream<TaskCommentRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TaskCommentRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TaskCommentRecord._();
  factory TaskCommentRecord([void Function(TaskCommentRecordBuilder) updates]) =
      _$TaskCommentRecord;

  static TaskCommentRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTaskCommentRecordData({
  String? taskCommentID,
  String? commentText,
  DateTime? createdDatetime,
  DocumentReference? userTaskID,
  DocumentReference? userID,
}) {
  final firestoreData = serializers.toFirestore(
    TaskCommentRecord.serializer,
    TaskCommentRecord(
      (t) => t
        ..taskCommentID = taskCommentID
        ..commentText = commentText
        ..createdDatetime = createdDatetime
        ..userTaskID = userTaskID
        ..userID = userID,
    ),
  );

  return firestoreData;
}
