import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'task_like_record.g.dart';

abstract class TaskLikeRecord
    implements Built<TaskLikeRecord, TaskLikeRecordBuilder> {
  static Serializer<TaskLikeRecord> get serializer =>
      _$taskLikeRecordSerializer;

  DateTime? get createdDatetime;

  DocumentReference? get userID;

  DocumentReference? get userTaskID;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TaskLikeRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('taskLike');

  static Stream<TaskLikeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TaskLikeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TaskLikeRecord._();
  factory TaskLikeRecord([void Function(TaskLikeRecordBuilder) updates]) =
      _$TaskLikeRecord;

  static TaskLikeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTaskLikeRecordData({
  DateTime? createdDatetime,
  DocumentReference? userID,
  DocumentReference? userTaskID,
}) {
  final firestoreData = serializers.toFirestore(
    TaskLikeRecord.serializer,
    TaskLikeRecord(
      (t) => t
        ..createdDatetime = createdDatetime
        ..userID = userID
        ..userTaskID = userTaskID,
    ),
  );

  return firestoreData;
}
