import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nowiutki_notes_app/controllers/api.dart';
import 'package:nowiutki_notes_app/screens/note.dart';
import 'package:nowiutki_notes_app/theme/theme.dart';
import 'package:provider/provider.dart';

import 'screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ApiController(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<ApiController>().themeChanger
          ? themeForDark
          : themeForBright,
      routes: {
        'noteScreen': (context) => NoteScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
