import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../selected_subject_screen/selected_subject_screen_widget.dart';
import '../settings_screen/settings_screen_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class MySubjectsWidget extends StatefulWidget {
  const MySubjectsWidget({Key? key}) : super(key: key);

  @override
  _MySubjectsWidgetState createState() => _MySubjectsWidgetState();
}

class _MySubjectsWidgetState extends State<MySubjectsWidget> {
  PagingController<DocumentSnapshot?, TaskSubjectRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  TextEditingController? textController;
  bool? checkboxListTileValue;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    textController?.dispose();
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
                  title: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                                child: Text(
                                  'My Subjects',
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .title1Family,
                                        color: FlutterFlowTheme.of(context)
                                            .skyBlueCrayola,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .title1Family),
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 50,
                                  icon: Icon(
                                    Icons.settings,
                                    color: FlutterFlowTheme.of(context)
                                        .skyBlueCrayola,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SettingsScreenWidget(),
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
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                elevation: 2,
              ),
            )
          : null,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 390,
                  height: 50,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).cornflowerBlue,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 10, 0, 0),
                        child: Text(
                          'Add Subject',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).title2,
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.add,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30,
                        ),
                        onPressed: () async {
                          setState(() {
                            FFAppState().showAddSubjectField = true;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: PagedListView<DocumentSnapshot<Object?>?,
                        TaskSubjectRecord>(
                      pagingController: () {
                        final Query<Object?> Function(Query<Object?>)
                            queryBuilder = (taskSubjectRecord) =>
                                taskSubjectRecord
                                    .where('subjectMemberList',
                                        arrayContains: currentUserReference)
                                    .orderBy('title');
                        if (_pagingController != null) {
                          final query =
                              queryBuilder(TaskSubjectRecord.collection);
                          if (query != _pagingQuery) {
                            // The query has changed
                            _pagingQuery = query;
                            _streamSubscriptions.forEach((s) => s?.cancel());
                            _streamSubscriptions.clear();
                            _pagingController!.refresh();
                          }
                          return _pagingController!;
                        }

                        _pagingController =
                            PagingController(firstPageKey: null);
                        _pagingQuery =
                            queryBuilder(TaskSubjectRecord.collection);
                        _pagingController!
                            .addPageRequestListener((nextPageMarker) {
                          queryTaskSubjectRecordPage(
                            queryBuilder: (taskSubjectRecord) =>
                                taskSubjectRecord
                                    .where('subjectMemberList',
                                        arrayContains: currentUserReference)
                                    .orderBy('title'),
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
                      scrollDirection: Axis.vertical,
                      builderDelegate:
                          PagedChildBuilderDelegate<TaskSubjectRecord>(
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
                        noItemsFoundIndicatorBuilder: (_) => Center(
                          child: Image.asset(
                            'assets/images/backgroundsssd.png',
                          ),
                        ),
                        itemBuilder: (context, _, listViewIndex) {
                          final listViewTaskSubjectRecord =
                              _pagingController!.itemList![listViewIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 6),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: SelectedSubjectScreenWidget(),
                                  ),
                                );
                                setState(() {
                                  FFAppState().SelectedSubject =
                                      listViewTaskSubjectRecord.reference;
                                });
                              },
                              child: ListTile(
                                title: Text(
                                  listViewTaskSubjectRecord.title!,
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .title1Family,
                                        color:
                                            listViewTaskSubjectRecord.isGroup!
                                                ? FlutterFlowTheme.of(context)
                                                    .cornflowerBlue
                                                : FlutterFlowTheme.of(context)
                                                    .skyBlueCrayola,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .title1Family),
                                      ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: FlutterFlowTheme.of(context).davysGrey,
                                  size: 20,
                                ),
                                tileColor:
                                    FlutterFlowTheme.of(context).polishedPine,
                                dense: false,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  if (FFAppState().showAddSubjectField)
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Container(
                        width: 390,
                        height: 300,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).cornflowerBlue,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Form(
                              key: formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: TextFormField(
                                  controller: textController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'textController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'name of subject...',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBlack,
                                    suffixIcon: textController!.text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              textController?.clear();
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color: Color(0xFF757575),
                                              size: 22,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .title3Family,
                                        fontSize: 20,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .title3Family),
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 15, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      final taskSubjectCreateData = {
                                        ...createTaskSubjectRecordData(
                                          title: textController!.text,
                                          isGroup: checkboxListTileValue,
                                          creatorID: currentUserReference,
                                        ),
                                        'createdDatetime':
                                            FieldValue.serverTimestamp(),
                                        'subjectMemberList': [
                                          currentUserReference
                                        ],
                                      };
                                      await TaskSubjectRecord.collection
                                          .doc()
                                          .set(taskSubjectCreateData);
                                      setState(() {
                                        FFAppState().showAddSubjectField =
                                            false;
                                      });
                                    },
                                    text: 'Save',
                                    options: FFButtonOptions(
                                      width: 130,
                                      height: 40,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .title3Family,
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .title3Family),
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 10,
                                    height: 100,
                                    constraints: BoxConstraints(
                                      maxHeight: 40,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .polishedPine,
                                      borderRadius: BorderRadius.circular(30),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 0, 0, 0),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .davysGrey,
                                        ),
                                        child: CheckboxListTile(
                                          value: checkboxListTileValue ??= true,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                checkboxListTileValue =
                                                    newValue!);
                                          },
                                          title: Text(
                                            'Is a group?',
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .title3Family,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title3Family),
                                                ),
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .skyBlueCrayola,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .skyBlueCrayola,
                                          checkColor:
                                              FlutterFlowTheme.of(context)
                                                  .davysGrey,
                                          dense: true,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}
