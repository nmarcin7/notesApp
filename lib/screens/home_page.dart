// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nowiutki_notes_app/controllers/api.dart';
import 'package:flutter/widgets.dart';
import 'package:nowiutki_notes_app/screens/note.dart';
import 'package:nowiutki_notes_app/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiController apiController = ApiController();

  String noteTitle = '';
  String textNote = '';
  DateTime dateTime = DateTime.now();
  String id = '';

  final titleController = TextEditingController();
  final noteController = TextEditingController();

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(25)),
                child: Container(
                  color: context.watch<ApiController>().themeChanger
                      ? Color(0xFF1B1A27)
                      : Color(0xFFF6F6F6),
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextField(
                            controller: titleController,
                            style: TextStyle(
                                color:
                                    context.watch<ApiController>().themeChanger
                                        ? Colors.white
                                        : Colors.black),
                            onChanged: (value) {
                              noteTitle = value;
                            },
                            decoration: InputDecoration(
                                errorText:
                                    context.watch<ApiController>().validateTitle
                                        ? 'this field cannot be empty'
                                        : null,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                contentPadding: EdgeInsets.only(left: 10),
                                hintText: 'Enter note title ...',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                                filled: true,
                                fillColor:
                                    context.watch<ApiController>().themeChanger
                                        ? Color(0xFF232434)
                                        : Colors.white),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextField(
                            controller: noteController,
                            style: TextStyle(
                                color:
                                    context.watch<ApiController>().themeChanger
                                        ? Colors.white
                                        : Colors.black),
                            onChanged: (value) {
                              textNote = value;
                            },
                            decoration: InputDecoration(
                                errorText:
                                    context.watch<ApiController>().validateNote
                                        ? 'this field cannot be empty'
                                        : null,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                contentPadding: EdgeInsets.only(left: 10),
                                hintText: 'Enter text note ...',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                                filled: true,
                                fillColor:
                                    context.watch<ApiController>().themeChanger
                                        ? Color(0xFF232434)
                                        : Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    context.watch<ApiController>().themeChanger
                                        ? Color(0xFF524D8F)
                                        : Colors.blueAccent)),
                            onPressed: () {
                              if (titleController.text.isEmpty) {
                                context
                                    .read<ApiController>()
                                    .changeValidationTitle();
                              } else if (noteController.text.isEmpty) {
                                context
                                    .read<ApiController>()
                                    .changeValidationNote();
                              } else {
                                apiController.addData(noteTitle, textNote);
                                context
                                    .read<ApiController>()
                                    .changeValidationTitle();
                                titleController.clear();
                                noteController.clear();
                                context.read<ApiController>().validateTitle =
                                    false;
                                context.read<ApiController>().validateNote =
                                    false;
                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              'SUBMIT',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(
          MdiIcons.notePlus,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'My notes',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: InkWell(
                      onTap: () {
                        context.read<ApiController>().changeTHeme();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        height: 35,
                        width: 35,
                        child: Icon(
                          context.watch<ApiController>().themeChanger
                              ? Icons.dark_mode
                              : Icons.light_mode,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  style: TextStyle(
                      color: context.watch<ApiController>().themeChanger
                          ? Colors.white
                          : Colors.black),
                  controller: textController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      prefixIcon: Icon(
                        MdiIcons.noteSearch,
                        color: Theme.of(context).cardColor,
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Theme.of(context).cardColor),
                      filled: true,
                      fillColor:
                          Theme.of(context).colorScheme.background, //0xFF232434
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                builder: (context, snapshot) {
                  List<Widget> mojalista = [];

                  if (!snapshot.hasData) {
                    return Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 3),
                      child: const Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  } else if (snapshot.data!.docs.isEmpty) {
                    return Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 3),
                      child: const Center(
                        child: Text(
                          'Notes are empty',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  } else {
                    final messages = snapshot.data?.docs;

                    for (var message in messages!) {
                      final noteTitle = message.get('noteTitle');
                      final textNote = message.get('textNote');

                      final creationDate = message.get('date').toDate();

                      final widgetId = message.id;

                      if (textController.text.isNotEmpty &&
                          !noteTitle
                              .toString()
                              .toLowerCase()
                              .startsWith(textController.text.toLowerCase())) {
                        continue;
                      }

                      final messageWidget = InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => NoteScreen(
                                title: noteTitle,
                                note: textNote,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Slidable(
                            endActionPane: ActionPane(
                              extentRatio: 0.30,
                              motion: DrawerMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (value) {
                                    context
                                        .read<ApiController>()
                                        .deleteData(widgetId);
                                  },
                                  backgroundColor: Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                            ),
                            child: Note(
                              noteTitle: noteTitle,
                              textNote: textNote,
                              dateTime: creationDate,
                            ),
                          ),
                        ),
                      );
                      mojalista.add(messageWidget);
                    }
                  }

                  return Column(
                    children: mojalista,
                  );
                },
                stream: apiController.firestore
                    .collection('messages')
                    .orderBy('date')
                    .snapshots(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
