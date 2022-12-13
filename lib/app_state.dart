import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  late SharedPreferences prefs;

  DocumentReference? _SelectedSubject;
  DocumentReference? get SelectedSubject => _SelectedSubject;
  set SelectedSubject(DocumentReference? _value) {
    notifyListeners();
    if (_value == null) {
      return;
    }
    _SelectedSubject = _value;
  }

  bool _showAddSubjectField = false;
  bool get showAddSubjectField => _showAddSubjectField;
  set showAddSubjectField(bool _value) {
    notifyListeners();

    _showAddSubjectField = _value;
  }

  DateTime? _selectedDueDate;
  DateTime? get selectedDueDate => _selectedDueDate;
  set selectedDueDate(DateTime? _value) {
    notifyListeners();
    if (_value == null) {
      return;
    }
    _selectedDueDate = _value;
  }

  List<DocumentReference> _userChatList = [];
  List<DocumentReference> get userChatList => _userChatList;
  set userChatList(List<DocumentReference> _value) {
    notifyListeners();

    _userChatList = _value;
  }

  void addToUserChatList(DocumentReference _value) {
    notifyListeners();
    _userChatList.add(_value);
  }

  void removeFromUserChatList(DocumentReference _value) {
    notifyListeners();
    _userChatList.remove(_value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
