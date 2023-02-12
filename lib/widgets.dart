import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nowiutki_notes_app/controllers/api.dart';
import 'dart:core';

import 'package:provider/provider.dart';

class Note extends StatelessWidget {
  String? noteTitle;
  String? textNote;
  DateTime? dateTime;

  // final time = DateTime.now();

  Note({this.noteTitle, this.textNote, this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.watch<ApiController>().themeChanger
            ? Color(0xFF232434)
            : Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      height: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              '$noteTitle',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: context.watch<ApiController>().themeChanger
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              '$textNote',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: context.watch<ApiController>().themeChanger
                    ? Colors.white
                    : Colors.black,
                fontSize: 14,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '${dateTime!.day}.${dateTime!.month}.${dateTime!.year} | ${dateTime!.hour}:${dateTime!.minute}',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
