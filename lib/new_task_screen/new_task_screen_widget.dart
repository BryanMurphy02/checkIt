import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import '../main.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewTaskScreenWidget extends StatefulWidget {
  const NewTaskScreenWidget({Key? key}) : super(key: key);

  @override
  _NewTaskScreenWidgetState createState() => _NewTaskScreenWidgetState();
}

class _NewTaskScreenWidgetState extends State<NewTaskScreenWidget> {
  DateTime? datePicked;
  bool? switchListTileValue;
  String? subjectSelectValue;
  TextEditingController? taskDescController;
  TextEditingController? taskNameController;
  TextEditingController? limitOfUsersController;
  var taskLocValue = FFPlace();
  int? taskPrivacyValue;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    limitOfUsersController = TextEditingController();
    taskDescController = TextEditingController();
    taskNameController = TextEditingController();
  }

  @override
  void dispose() {
    limitOfUsersController?.dispose();
    taskDescController?.dispose();
    taskNameController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<TaskSubjectRecord>>(
      future: queryTaskSubjectRecordOnce(
        queryBuilder: (taskSubjectRecord) => taskSubjectRecord
            .where('subjectMemberList', arrayContains: currentUserReference),
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
        List<TaskSubjectRecord> newTaskScreenTaskSubjectRecordList =
            snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: responsiveVisibility(
            context: context,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          )
              ? AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                  automaticallyImplyLeading: false,
                  title: Text(
                    'New Task',
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: FlutterFlowTheme.of(context).title2Family,
                          color: FlutterFlowTheme.of(context).skyBlueCrayola,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).title2Family),
                        ),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        buttonSize: 48,
                        icon: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 30,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                  centerTitle: false,
                  elevation: 0,
                )
              : null,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 390,
                        height: 844,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).polishedPine,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 0),
                                  child: TextFormField(
                                    controller: taskNameController,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      'taskNameController',
                                      Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Task Name',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .title3Family,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .title3Family),
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 32, 20, 12),
                                      suffixIcon:
                                          taskNameController!.text.isNotEmpty
                                              ? InkWell(
                                                  onTap: () async {
                                                    taskNameController?.clear();
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
                                    style: FlutterFlowTheme.of(context).title3,
                                    textAlign: TextAlign.start,
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'Please enter task title';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 0),
                                  child: TextFormField(
                                    controller: taskDescController,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      'taskDescController',
                                      Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Enter description here...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBlack,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 32, 20, 12),
                                      suffixIcon:
                                          taskDescController!.text.isNotEmpty
                                              ? InkWell(
                                                  onTap: () async {
                                                    taskDescController?.clear();
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
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    textAlign: TextAlign.start,
                                    maxLines: 4,
                                    keyboardType: TextInputType.multiline,
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'PLease enter title description';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 0),
                                  child: FutureBuilder<List<TaskSubjectRecord>>(
                                    future: queryTaskSubjectRecordOnce(
                                      queryBuilder: (taskSubjectRecord) =>
                                          taskSubjectRecord.where(
                                              'taskSubjectID',
                                              isEqualTo: subjectSelectValue),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      List<TaskSubjectRecord>
                                          subjectSelectTaskSubjectRecordList =
                                          snapshot.data!;
                                      final subjectSelectTaskSubjectRecord =
                                          subjectSelectTaskSubjectRecordList
                                                  .isNotEmpty
                                              ? subjectSelectTaskSubjectRecordList
                                                  .first
                                              : null;
                                      return FlutterFlowDropDown<String>(
                                        initialOption: subjectSelectValue ??=
                                            '',
                                        options:
                                            newTaskScreenTaskSubjectRecordList
                                                .map((e) => e.taskSubjectID!)
                                                .toList()
                                                .toList(),
                                        optionLabels:
                                            newTaskScreenTaskSubjectRecordList
                                                .map((e) =>
                                                    valueOrDefault<String>(
                                                      e.title!,
                                                      'Subject',
                                                    ))
                                                .toList()
                                                .toList(),
                                        onChanged: (val) async {
                                          setState(
                                              () => subjectSelectValue = val);
                                          setState(() {
                                            FFAppState().SelectedSubject =
                                                subjectSelectTaskSubjectRecord!
                                                    .reference;
                                          });
                                        },
                                        width: double.infinity,
                                        height: 60,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                        hintText: 'Select Subject',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 15,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        borderWidth: 2,
                                        borderRadius: 8,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            24, 4, 12, 4),
                                        hidesUnderline: true,
                                      );
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 16, 0),
                                      child: FlutterFlowPlacePicker(
                                        iOSGoogleMapsApiKey: '',
                                        androidGoogleMapsApiKey: '',
                                        webGoogleMapsApiKey: '',
                                        onSelect: (place) async {
                                          setState(() => taskLocValue = place);
                                        },
                                        defaultText: 'Select Location',
                                        icon: Icon(
                                          Icons.place,
                                          color: FlutterFlowTheme.of(context)
                                              .davysGrey,
                                          size: 16,
                                        ),
                                        buttonOptions: FFButtonOptions(
                                          width: 200,
                                          height: 45,
                                          color: FlutterFlowTheme.of(context)
                                              .black600,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2Family,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .subtitle2Family),
                                              ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 24, 0),
                                        child: Container(
                                          width: 20,
                                          child: TextFormField(
                                            controller: limitOfUsersController,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: '# of users',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBlack,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            textAlign: TextAlign.center,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[0-9]'))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 0),
                                  child: FlutterFlowDropDown<int>(
                                    initialOption: taskPrivacyValue ??= 0,
                                    options: [0, 3, 2],
                                    optionLabels: [
                                      'Private',
                                      'Public',
                                      'Friends Only'
                                    ],
                                    onChanged: (val) =>
                                        setState(() => taskPrivacyValue = val),
                                    width: double.infinity,
                                    height: 60,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    hintText: 'Select Privacy',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 15,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderWidth: 2,
                                    borderRadius: 8,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        24, 4, 12, 4),
                                    hidesUnderline: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 0),
                                  child: Container(
                                    width: 390,
                                    height: 165,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 12, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 1, 0, 0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    final _datePickedDate =
                                                        await showDatePicker(
                                                      context: context,
                                                      initialDate: datePicked!,
                                                      firstDate: datePicked!,
                                                      lastDate: DateTime(2050),
                                                    );

                                                    TimeOfDay? _datePickedTime;
                                                    if (_datePickedDate !=
                                                        null) {
                                                      _datePickedTime =
                                                          await showTimePicker(
                                                        context: context,
                                                        initialTime: TimeOfDay
                                                            .fromDateTime(
                                                                datePicked!),
                                                      );
                                                    }

                                                    if (_datePickedDate !=
                                                            null &&
                                                        _datePickedTime !=
                                                            null) {
                                                      setState(
                                                        () => datePicked =
                                                            DateTime(
                                                          _datePickedDate.year,
                                                          _datePickedDate.month,
                                                          _datePickedDate.day,
                                                          _datePickedTime!.hour,
                                                          _datePickedTime
                                                              .minute,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  text: 'Due Date',
                                                  options: FFButtonOptions(
                                                    width: 130,
                                                    height: 40,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2Family,
                                                          color: Colors.white,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2Family),
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 12, 0),
                                                child: Container(
                                                  width: 200,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .skyBlueCrayola,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 8, 0, 8),
                                                    child: Text(
                                                      dateTimeFormat(
                                                        'M/d h:mm a',
                                                        datePicked,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title3,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 12, 16, 0),
                                          child: SwitchListTile(
                                            value: switchListTileValue ??= true,
                                            onChanged: (newValue) async {
                                              setState(() =>
                                                  switchListTileValue =
                                                      newValue!);
                                            },
                                            title: Text(
                                              'Joinable',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .skyBlueCrayola,
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .skyBlueCrayola,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .skyBlueCrayola,
                                            dense: true,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 24, 0, 2),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (formKey.currentState == null ||
                                          !formKey.currentState!.validate()) {
                                        return;
                                      }

                                      if (subjectSelectValue == null) {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.scale,
                                            alignment: Alignment.bottomCenter,
                                            duration:
                                                Duration(milliseconds: 100),
                                            reverseDuration:
                                                Duration(milliseconds: 100),
                                            child: NavBarPage(
                                                initialPage: 'mySubjects'),
                                          ),
                                        );
                                        return;
                                      }
                                      if (taskPrivacyValue == null) {
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Must select a privacy level',
                                              style: TextStyle(
                                                color: Color(0xFFFF0000),
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0x00000000),
                                          ),
                                        );
                                        return;
                                      }

                                      final userTaskCreateData = {
                                        ...createUserTaskRecordData(
                                          title: taskNameController!.text,
                                          description: taskDescController!.text,
                                          location: taskLocValue.latLng,
                                          datetime: datePicked,
                                          userLimit: int.tryParse(
                                              limitOfUsersController!.text),
                                          isJoinable: switchListTileValue,
                                          scope: taskPrivacyValue,
                                          isCompleted: false,
                                          userID: currentUserReference,
                                          amountOfLikes: 0,
                                          isLIked: false,
                                          taskSubjectID:
                                              FFAppState().SelectedSubject,
                                        ),
                                        'createdDatetime':
                                            FieldValue.serverTimestamp(),
                                        'userList': [currentUserReference],
                                      };
                                      await UserTaskRecord.collection
                                          .doc()
                                          .set(userTaskCreateData);
                                    },
                                    text: 'Create Task',
                                    options: FFButtonOptions(
                                      width: 270,
                                      height: 50,
                                      color: FlutterFlowTheme.of(context)
                                          .cornflowerBlue,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle1Family,
                                            color: FlutterFlowTheme.of(context)
                                                .davysGrey,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1Family),
                                          ),
                                      elevation: 3,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
