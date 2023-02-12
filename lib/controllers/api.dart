import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApiController with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseFirestore get firestore => _firestore;

  bool themeChanger = false;
  bool validateTitle = false;
  bool validateNote = false;

  void changeValidationNote() {
    validateNote = true;
    notifyListeners();
  }

  void changeValidationTitle() {
    validateTitle = true;
    notifyListeners();
  }

  void changeTHeme() {
    themeChanger = !themeChanger;
    notifyListeners();
  }

  void addData(String noteTitle, String textNote) async {
    await _firestore.collection('messages').add({
      'noteTitle': noteTitle,
      'textNote': textNote,
      'date': DateTime.now(),
    });
  }

  void deleteData(String id) async {
    await _firestore.collection('messages').doc(id).delete();
  }
}
