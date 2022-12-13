import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flip_card/flip_card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectedSubjectScreenWidget extends StatefulWidget {
  const SelectedSubjectScreenWidget({Key? key}) : super(key: key);

  @override
  _SelectedSubjectScreenWidgetState createState() =>
      _SelectedSubjectScreenWidgetState();
}

class _SelectedSubjectScreenWidgetState
    extends State<SelectedSubjectScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<TaskSubjectRecord>(
      stream: TaskSubjectRecord.getDocument(FFAppState().SelectedSubject!),
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
        final selectedSubjectScreenTaskSubjectRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: responsiveVisibility(
            context: context,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          )
              ? AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: FlutterFlowTheme.of(context).skyBlueCrayola,
                      size: 30,
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NavBarPage(initialPage: 'mySubjects'),
                        ),
                      );
                    },
                  ),
                  title: Text(
                    selectedSubjectScreenTaskSubjectRecord.title!,
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: FlutterFlowTheme.of(context).title2Family,
                          color: FlutterFlowTheme.of(context).skyBlueCrayola,
                          fontSize: 22,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).title2Family),
                        ),
                  ),
                  actions: [],
                  centerTitle: false,
                  elevation: 2,
                )
              : null,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    desktop: false,
                  ))
                    Expanded(
                      child: StreamBuilder<List<UserTaskRecord>>(
                        stream: queryUserTaskRecord(
                          queryBuilder: (userTaskRecord) =>
                              userTaskRecord.where('taskSubjectID',
                                  isEqualTo: FFAppState().SelectedSubject),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitFadingCircle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<UserTaskRecord> listViewUserTaskRecordList =
                              snapshot.data!;
                          if (listViewUserTaskRecordList.isEmpty) {
                            return Image.asset(
                              'assets/images/backgroundsssd.png',
                            );
                          }
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewUserTaskRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewUserTaskRecord =
                                  listViewUserTaskRecordList[listViewIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
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
                                    List<TaskLikeRecord>
                                        userPostTaskLikeRecordList =
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
                                      width: MediaQuery.of(context).size.width *
                                          0.94,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 2, 0),
                                            child: FutureBuilder<UsersRecord>(
                                              future:
                                                  UsersRecord.getDocumentOnce(
                                                      listViewUserTaskRecord
                                                          .userID!),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          SpinKitFadingCircle(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Card(
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
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
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            userInfoUsersRecord
                                                                .photoUrl!,
                                                            fit:
                                                                BoxFit.fitWidth,
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
                                                                        12,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              userInfoUsersRecord
                                                                  .displayName!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Text(
                                                  listViewUserTaskRecord.title!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title1,
                                                ),
                                              ),
                                            ),
                                            back: Container(
                                              width: 390,
                                              height: 250,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .polishedPine,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 16, 12, 16),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    12, 12),
                                                        child: AutoSizeText(
                                                          listViewUserTaskRecord
                                                              .description!,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .title3,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12, 0, 12, 0),
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
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        12,
                                                                        0),
                                                            child: Text(
                                                              listViewUserTaskRecord
                                                                  .datetime!
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3,
                                                            ),
                                                          ),
                                                          if (listViewUserTaskRecord
                                                                  .location !=
                                                              null)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                listViewUserTaskRecord
                                                                    .location!
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 8, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 16, 0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          if (listViewUserTaskRecord
                                                                  .isLIked! &&
                                                              (userPostTaskLikeRecord !=
                                                                  null)) {
                                                            final taskLikeCreateData =
                                                                {
                                                              ...createTaskLikeRecordData(
                                                                userID:
                                                                    currentUserReference,
                                                                userTaskID:
                                                                    listViewUserTaskRecord
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
                                                                      .increment(
                                                                          1),
                                                            };
                                                            await listViewUserTaskRecord
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
                                                            await listViewUserTaskRecord
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
                                                              onPressed:
                                                                  () async {
                                                                final userTaskUpdateData =
                                                                    {
                                                                  'isLIked':
                                                                      !listViewUserTaskRecord
                                                                          .isLIked!,
                                                                };
                                                                await listViewUserTaskRecord
                                                                    .reference
                                                                    .update(
                                                                        userTaskUpdateData);
                                                              },
                                                              value:
                                                                  listViewUserTaskRecord
                                                                      .isLIked!,
                                                              onIcon: Icon(
                                                                Icons
                                                                    .favorite_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 25,
                                                              ),
                                                              offIcon: Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .grayIcon,
                                                                size: 25,
                                                              ),
                                                            ),
                                                            if (listViewUserTaskRecord
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
                                                                  listViewUserTaskRecord
                                                                      .amountOfLikes!
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
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
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
