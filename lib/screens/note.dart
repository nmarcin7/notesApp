import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';

import '../controllers/api.dart';

class NoteScreen extends StatelessWidget {
  String? title;
  String? note;
  NoteScreen({this.title, this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: context.watch<ApiController>().themeChanger
                ? Colors.white
                : Colors.black),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 2,
        centerTitle: true,
        title: Text(
          title!,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              // height: 200,
              // width: MediaQuery.of(context).size.width,
              // color: Color(0xFF232434),
              child: Column(
                children: [
                  AutoSizeText(
                    note!,
                    maxLines: 14,
                    style: TextStyle(
                      letterSpacing: 1,
                      height: 2,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
