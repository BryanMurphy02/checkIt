import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flip_card/flip_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class HomeFeedScreenWidget extends StatefulWidget {
  const HomeFeedScreenWidget({Key? key}) : super(key: key);

  @override
  _HomeFeedScreenWidgetState createState() => _HomeFeedScreenWidgetState();
}

class _HomeFeedScreenWidgetState extends State<HomeFeedScreenWidget> {
  PagingController<DocumentSnapshot?, UserTaskRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  bool? switchValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: responsiveVisibility(
        context: context,
        tablet: false,
        tabletLandscape: false,
        desktop: false,
      )
          ? PreferredSize(
              preferredSize: Size.fromHeight(65),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                automaticallyImplyLeading: false,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  title: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Switch(
                            value: switchValue ??= true,
                            onChanged: (newValue) async {
                              setState(() => switchValue = newValue!);
                            },
                            activeColor:
                                FlutterFlowTheme.of(context).cornflowerBlue,
                            activeTrackColor:
                                FlutterFlowTheme.of(context).cornflowerBlue,
                            inactiveTrackColor:
                                FlutterFlowTheme.of(context).skyBlueCrayola,
                            inactiveThumbColor:
                                FlutterFlowTheme.of(context).skyBlueCrayola,
                          ),
                          if (responsiveVisibility(
                            context: context,
                            desktop: false,
                          ))
                            Text(
                              switchValue! ? 'Discover' : 'Friends & Groups',
                              style: FlutterFlowTheme.of(context)
                                  .title3
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .title3Family,
                                    color: FlutterFlowTheme.of(context).gray600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .title3Family),
                                  ),
                            ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.search_outlined,
                              color: FlutterFlowTheme.of(context).gray600,
                              size: 30,
                            ),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NavBarPage(
                                      initialPage: 'InteractionsScreen'),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                elevation: 2,
              ),
            )
          : null,
      body: Stack(
        children: [
          if (!switchValue!)
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StreamBuilder<List<UserTaskRecord>>(
                    stream: queryUserTaskRecord(
                      queryBuilder: (userTaskRecord) => userTaskRecord
                          .where('scope', isGreaterThanOrEqualTo: 3),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: SpinKitFadingCircle(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 50,
                            ),
                          ),
                        );
                      }
                      List<UserTaskRecord> socialFeedDUserTaskRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: socialFeedDUserTaskRecordList.length,
                        itemBuilder: (context, socialFeedDIndex) {
                          final socialFeedDUserTaskRecord =
                              socialFeedDUserTaskRecordList[socialFeedDIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                            child: StreamBuilder<List<TaskLikeRecord>>(
                              stream: queryTaskLikeRecord(
                                queryBuilder: (taskLikeRecord) =>
                                    taskLikeRecord.where('userID',
                                        isEqualTo:
                                            socialFeedDUserTaskRecord.userID),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitFadingCircle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                List<TaskLikeRecord>
                                    userPostTaskLikeRecordList = snapshot.data!;
                                // Return an empty Container when the document does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final userPostTaskLikeRecord =
                                    userPostTaskLikeRecordList.isNotEmpty
                                        ? userPostTaskLikeRecordList.first
                                        : null;
                                return Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.94,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 2, 0),
                                        child: FutureBuilder<UsersRecord>(
                                          future: UsersRecord.getDocumentOnce(
                                              socialFeedDUserTaskRecord
                                                  .userID!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child: SpinKitFadingCircle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 50,
                                                  ),
                                                ),
                                              );
                                            }
                                            final userInfoUsersRecord =
                                                snapshot.data!;
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                1, 1, 1, 1),
                                                    child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        userInfoUsersRecord
                                                            .photoUrl!,
                                                        fit: BoxFit.fitWidth,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          userInfoUsersRecord
                                                              .displayName!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30,
                                                        buttonSize: 46,
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_control,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gray600,
                                                          size: 20,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      FlipCard(
                                        fill: Fill.fillBack,
                                        direction: FlipDirection.HORIZONTAL,
                                        speed: 400,
                                        front: Container(
                                          height: 250,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Text(
                                                  socialFeedDUserTaskRecord
                                                      .title!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title1,
                                                ),
                                              ),
                                              Text(
                                                socialFeedDUserTaskRecord
                                                        .isCompleted!
                                                    ? 'Completed'
                                                    : 'Not Complete',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title3,
                                              ),
                                            ],
                                          ),
                                        ),
                                        back: Container(
                                          width: 390,
                                          height: 250,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 16, 12, 16),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Text(
                                                    socialFeedDUserTaskRecord
                                                        .description!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 12, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    12, 0),
                                                        child: Text(
                                                          socialFeedDUserTaskRecord
                                                              .datetime!
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .title3,
                                                        ),
                                                      ),
                                                      if (socialFeedDUserTaskRecord
                                                              .location !=
                                                          null)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(12,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            socialFeedDUserTaskRecord
                                                                .location!
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title3,
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 8, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 16, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      if (socialFeedDUserTaskRecord
                                                              .isLIked! &&
                                                          !(userPostTaskLikeRecord !=
                                                              null)) {
                                                        final taskLikeCreateData =
                                                            {
                                                          ...createTaskLikeRecordData(
                                                            userID:
                                                                currentUserReference,
                                                            userTaskID:
                                                                socialFeedDUserTaskRecord
                                                                    .reference,
                                                          ),
                                                          'createdDatetime':
                                                              FieldValue
                                                                  .serverTimestamp(),
                                                        };
                                                        await TaskLikeRecord
                                                            .collection
                                                            .doc()
                                                            .set(
                                                                taskLikeCreateData);

                                                        final userTaskUpdateData =
                                                            {
                                                          'amountOfLikes':
                                                              FieldValue
                                                                  .increment(1),
                                                        };
                                                        await socialFeedDUserTaskRecord
                                                            .reference
                                                            .update(
                                                                userTaskUpdateData);
                                                      } else {
                                                        await userPostTaskLikeRecord!
                                                            .reference
                                                            .delete();

                                                        final userTaskUpdateData =
                                                            {
                                                          'amountOfLikes':
                                                              FieldValue
                                                                  .increment(
                                                                      -(1)),
                                                        };
                                                        await socialFeedDUserTaskRecord
                                                            .reference
                                                            .update(
                                                                userTaskUpdateData);
                                                      }
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ToggleIcon(
                                                          onPressed: () async {
                                                            final userTaskUpdateData =
                                                                {
                                                              'isLIked':
                                                                  !socialFeedDUserTaskRecord
                                                                      .isLIked!,
                                                            };
                                                            await socialFeedDUserTaskRecord
                                                                .reference
                                                                .update(
                                                                    userTaskUpdateData);
                                                          },
                                                          value:
                                                              socialFeedDUserTaskRecord
                                                                  .isLIked!,
                                                          onIcon: Icon(
                                                            Icons
                                                                .favorite_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 25,
                                                          ),
                                                          offIcon: Icon(
                                                            Icons
                                                                .favorite_border,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .grayIcon,
                                                            size: 25,
                                                          ),
                                                        ),
                                                        if (socialFeedDUserTaskRecord
                                                                .amountOfLikes! >
                                                            0)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              socialFeedDUserTaskRecord
                                                                  .amountOfLikes!
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (socialFeedDUserTaskRecord
                                                    .scope! >=
                                                2)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 0, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    if (socialFeedDUserTaskRecord
                                                            .userList!
                                                            .toList()
                                                            .length <
                                                        socialFeedDUserTaskRecord
                                                            .userLimit!) {
                                                      if (socialFeedDUserTaskRecord
                                                              .isJoinable! &&
                                                          !socialFeedDUserTaskRecord
                                                              .userList!
                                                              .toList()
                                                              .contains(
                                                                  currentUserReference)) {
                                                        final taskSubjectUpdateData =
                                                            {
                                                          'subjectMemberList':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            currentUserReference
                                                          ]),
                                                        };
                                                        await socialFeedDUserTaskRecord
                                                            .taskSubjectID!
                                                            .update(
                                                                taskSubjectUpdateData);

                                                        final userTaskUpdateData =
                                                            {
                                                          'userList': FieldValue
                                                              .arrayUnion([
                                                            currentUserReference
                                                          ]),
                                                        };
                                                        await socialFeedDUserTaskRecord
                                                            .reference
                                                            .update(
                                                                userTaskUpdateData);
                                                      } else {
                                                        final taskSubjectUpdateData =
                                                            {
                                                          'subjectMemberList':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            currentUserReference
                                                          ]),
                                                        };
                                                        await socialFeedDUserTaskRecord
                                                            .taskSubjectID!
                                                            .update(
                                                                taskSubjectUpdateData);

                                                        final userTaskUpdateData =
                                                            {
                                                          'userList': FieldValue
                                                              .arrayRemove([
                                                            currentUserReference
                                                          ]),
                                                        };
                                                        await socialFeedDUserTaskRecord
                                                            .reference
                                                            .update(
                                                                userTaskUpdateData);
                                                      }
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'At Capacity'),
                                                            content: Text(
                                                                'Too many people have joined this task!'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(45, 0,
                                                                    0, 0),
                                                        child: ToggleIcon(
                                                          onPressed: () async {
                                                            final userTaskUpdateData =
                                                                {
                                                              'isJoinable':
                                                                  !socialFeedDUserTaskRecord
                                                                      .isJoinable!,
                                                            };
                                                            await socialFeedDUserTaskRecord
                                                                .reference
                                                                .update(
                                                                    userTaskUpdateData);
                                                          },
                                                          value:
                                                              socialFeedDUserTaskRecord
                                                                  .isJoinable!,
                                                          onIcon: Icon(
                                                            Icons
                                                                .playlist_add_check_outlined,
                                                            color: Color(
                                                                0xFF70A288),
                                                            size: 25,
                                                          ),
                                                          offIcon: Icon(
                                                            Icons.playlist_add,
                                                            color: Color(
                                                                0xFF95A1AC),
                                                            size: 25,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          if (switchValue ?? true)
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  PagedListView<DocumentSnapshot<Object?>?, UserTaskRecord>(
                    pagingController: () {
                      final Query<Object?> Function(Query<Object?>)
                          queryBuilder = (userTaskRecord) =>
                              userTaskRecord.where('scope', isLessThan: 3);
                      if (_pagingController != null) {
                        final query = queryBuilder(UserTaskRecord.collection);
                        if (query != _pagingQuery) {
                          // The query has changed
                          _pagingQuery = query;
                          _streamSubscriptions.forEach((s) => s?.cancel());
                          _streamSubscriptions.clear();
                          _pagingController!.refresh();
                        }
                        return _pagingController!;
                      }

                      _pagingController = PagingController(firstPageKey: null);
                      _pagingQuery = queryBuilder(UserTaskRecord.collection);
                      _pagingController!
                          .addPageRequestListener((nextPageMarker) {
                        queryUserTaskRecordPage(
                          queryBuilder: (userTaskRecord) =>
                              userTaskRecord.where('scope', isLessThan: 3),
                          nextPageMarker: nextPageMarker,
                          pageSize: 25,
                          isStream: true,
                        ).then((page) {
                          _pagingController!.appendPage(
                            page.data,
                            page.nextPageMarker,
                          );
                          final streamSubscription =
                              page.dataStream?.listen((data) {
                            final itemIndexes = _pagingController!.itemList!
                                .asMap()
                                .map((k, v) => MapEntry(v.reference.id, k));
                            data.forEach((item) {
                              final index = itemIndexes[item.reference.id];
                              final items = _pagingController!.itemList!;
                              if (index != null) {
                                items.replaceRange(index, index + 1, [item]);
                                _pagingController!.itemList = {
                                  for (var item in items) item.reference: item
                                }.values.toList();
                              }
                            });
                            setState(() {});
                          });
                          _streamSubscriptions.add(streamSubscription);
                        });
                      });
                      return _pagingController!;
                    }(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    builderDelegate: PagedChildBuilderDelegate<UserTaskRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: SpinKitFadingCircle(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 50,
                          ),
                        ),
                      ),

                      itemBuilder: (context, _, socialFeedFGIndex) {
                        final socialFeedFGUserTaskRecord =
                            _pagingController!.itemList![socialFeedFGIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                          child: FutureBuilder<List<TaskLikeRecord>>(
                            future: queryTaskLikeRecordOnce(
                              queryBuilder: (taskLikeRecord) =>
                                  taskLikeRecord.where('userID',
                                      isEqualTo: currentUserReference),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitFadingCircle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              List<TaskLikeRecord> userPostTaskLikeRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the document does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final userPostTaskLikeRecord =
                                  userPostTaskLikeRecordList.isNotEmpty
                                      ? userPostTaskLikeRecordList.first
                                      : null;
                              return Container(
                                width: MediaQuery.of(context).size.width * 0.94,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 2, 0),
                                      child: FutureBuilder<UsersRecord>(
                                        future: UsersRecord.getDocumentOnce(
                                            socialFeedFGUserTaskRecord.userID!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: SpinKitFadingCircle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 50,
                                                ),
                                              ),
                                            );
                                          }
                                          final userInfoUsersRecord =
                                              snapshot.data!;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(1, 1, 1, 1),
                                                  child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      userInfoUsersRecord
                                                          .photoUrl!,
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12, 0, 0, 0),
                                                      child: Text(
                                                        userInfoUsersRecord
                                                            .displayName!,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30,
                                                      buttonSize: 46,
                                                      icon: Icon(
                                                        Icons.keyboard_control,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gray600,
                                                        size: 20,
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    FlipCard(
                                      fill: Fill.fillBack,
                                      direction: FlipDirection.HORIZONTAL,
                                      speed: 400,
                                      front: Container(
                                        height: 250,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .cornflowerBlue,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Text(
                                                socialFeedFGUserTaskRecord
                                                    .title!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title1,
                                              ),
                                            ),
                                            Text(
                                              socialFeedFGUserTaskRecord
                                                      .isCompleted!
                                                  ? 'Completed'
                                                  : 'Not Completed',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3,
                                            ),
                                          ],
                                        ),
                                      ),
                                      back: Container(
                                        width: 390,
                                        height: 250,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .cornflowerBlue,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 16, 12, 16),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Text(
                                                  socialFeedFGUserTaskRecord
                                                      .description!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 12, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 12, 0),
                                                      child: Text(
                                                        socialFeedFGUserTaskRecord
                                                            .datetime!
                                                            .toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title3,
                                                      ),
                                                    ),
                                                    if (socialFeedFGUserTaskRecord
                                                            .location !=
                                                        null)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          socialFeedFGUserTaskRecord
                                                              .location!
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .title3,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 8, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 16, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    if (socialFeedFGUserTaskRecord
                                                            .isLIked! &&
                                                        !(userPostTaskLikeRecord !=
                                                            null)) {
                                                      final taskLikeCreateData =
                                                          {
                                                        ...createTaskLikeRecordData(
                                                          userID:
                                                              currentUserReference,
                                                          userTaskID:
                                                              socialFeedFGUserTaskRecord
                                                                  .reference,
                                                        ),
                                                        'createdDatetime':
                                                            FieldValue
                                                                .serverTimestamp(),
                                                      };
                                                      await TaskLikeRecord
                                                          .collection
                                                          .doc()
                                                          .set(
                                                              taskLikeCreateData);

                                                      final userTaskUpdateData =
                                                          {
                                                        'amountOfLikes':
                                                            FieldValue
                                                                .increment(1),
                                                      };
                                                      await socialFeedFGUserTaskRecord
                                                          .reference
                                                          .update(
                                                              userTaskUpdateData);
                                                    } else {
                                                      await userPostTaskLikeRecord!
                                                          .reference
                                                          .delete();

                                                      final userTaskUpdateData =
                                                          {
                                                        'amountOfLikes':
                                                            FieldValue
                                                                .increment(
                                                                    -(1)),
                                                      };
                                                      await socialFeedFGUserTaskRecord
                                                          .reference
                                                          .update(
                                                              userTaskUpdateData);
                                                    }
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      ToggleIcon(
                                                        onPressed: () async {
                                                          final userTaskUpdateData =
                                                              {
                                                            'isLIked':
                                                                !socialFeedFGUserTaskRecord
                                                                    .isLIked!,
                                                          };
                                                          await socialFeedFGUserTaskRecord
                                                              .reference
                                                              .update(
                                                                  userTaskUpdateData);
                                                        },
                                                        value:
                                                            socialFeedFGUserTaskRecord
                                                                .isLIked!,
                                                        onIcon: Icon(
                                                          Icons
                                                              .favorite_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 25,
                                                        ),
                                                        offIcon: Icon(
                                                          Icons.favorite_border,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grayIcon,
                                                          size: 25,
                                                        ),
                                                      ),
                                                      if (socialFeedFGUserTaskRecord
                                                              .amountOfLikes! >
                                                          0)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(4,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            socialFeedFGUserTaskRecord
                                                                .amountOfLikes!
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2,
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (socialFeedFGUserTaskRecord
                                                  .scope! >=
                                              2)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 0, 0, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  if (socialFeedFGUserTaskRecord
                                                          .userList!
                                                          .toList()
                                                          .length <
                                                      socialFeedFGUserTaskRecord
                                                          .userLimit!) {
                                                    if (socialFeedFGUserTaskRecord
                                                            .isJoinable! &&
                                                        socialFeedFGUserTaskRecord
                                                            .userList!
                                                            .toList()
                                                            .contains(
                                                                currentUserReference)) {
                                                      final taskSubjectUpdateData =
                                                          {
                                                        'subjectMemberList':
                                                            FieldValue
                                                                .arrayUnion([
                                                          currentUserReference
                                                        ]),
                                                      };
                                                      await socialFeedFGUserTaskRecord
                                                          .taskSubjectID!
                                                          .update(
                                                              taskSubjectUpdateData);

                                                      final userTaskUpdateData =
                                                          {
                                                        'userList': FieldValue
                                                            .arrayUnion([
                                                          currentUserReference
                                                        ]),
                                                      };
                                                      await socialFeedFGUserTaskRecord
                                                          .reference
                                                          .update(
                                                              userTaskUpdateData);
                                                    } else {
                                                      final taskSubjectUpdateData =
                                                          {
                                                        'subjectMemberList':
                                                            FieldValue
                                                                .arrayRemove([
                                                          currentUserReference
                                                        ]),
                                                      };
                                                      await socialFeedFGUserTaskRecord
                                                          .taskSubjectID!
                                                          .update(
                                                              taskSubjectUpdateData);

                                                      final userTaskUpdateData =
                                                          {
                                                        'userList': FieldValue
                                                            .arrayRemove([
                                                          currentUserReference
                                                        ]),
                                                      };
                                                      await socialFeedFGUserTaskRecord
                                                          .reference
                                                          .update(
                                                              userTaskUpdateData);
                                                    }
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'At Capacity'),
                                                          content: Text(
                                                              'Too many people have joined this task!'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  45, 0, 0, 0),
                                                      child: ToggleIcon(
                                                        onPressed: () async {
                                                          final userTaskUpdateData =
                                                              {
                                                            'isJoinable':
                                                                !socialFeedFGUserTaskRecord
                                                                    .isJoinable!,
                                                          };
                                                          await socialFeedFGUserTaskRecord
                                                              .reference
                                                              .update(
                                                                  userTaskUpdateData);
                                                        },
                                                        value:
                                                            socialFeedFGUserTaskRecord
                                                                .isJoinable!,
                                                        onIcon: Icon(
                                                          Icons
                                                              .playlist_add_check_outlined,
                                                          color:
                                                              Color(0xFF70A288),
                                                          size: 25,
                                                        ),
                                                        offIcon: Icon(
                                                          Icons.playlist_add,
                                                          color:
                                                              Color(0xFF95A1AC),
                                                          size: 25,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
