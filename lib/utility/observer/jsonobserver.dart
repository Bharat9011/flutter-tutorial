import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertutorial/custom/custom_code.dart';
import 'package:fluttertutorial/custom/headingText.dart';
import 'package:fluttertutorial/custom/number_list_text.dart';
import 'package:fluttertutorial/custom/paragraphText.dart';
import 'package:fluttertutorial/custom/point_list_text.dart';
import 'package:fluttertutorial/custom/sub_heading_Text.dart';
import 'package:fluttertutorial/screen/flutter_course/screen_type.dart/component/ListViewMCQGen.dart';
import 'package:fluttertutorial/screen/flutter_course/screen_type.dart/mcq_type.dart';
import 'package:fluttertutorial/screen/flutter_course/screen_type.dart/theory_type.dart';

class Jsonobserver {
  static Future<List<Widget>> GetJsonValue(String fileName) async {
    try {
      var jsonData = await getJsonFilePath(fileName);

      Map<String, dynamic> data = json.decode(jsonData.toString());
      List<Widget> listWidget = [];
      List<Widget> listOfScreen = [];

      for (var value in data.values) {
        final typeOf = value["typeOf"] ?? "";
        final content = value["content"] ?? "";
        final type = value["type"] ?? "";

        if (typeOf == "Text") {
          final widget = TextGen(content, type, typeOf);
          listWidget.add(widget);
        }

        if (typeOf == "List") {
          final widget = ListViewPointGen(content, type, typeOf);
          listWidget.add(widget);
        }

        if (typeOf == "code") {
          final widget = CodeGen(content);
          listWidget.add(widget);
        }

        if (typeOf == "Table") {
          final widget = TableViewGen(content);
          listWidget.add(widget);
        }

        if (typeOf == "List-Text-number") {
          final content = value["content"];
          if (content != null && content is List) {
            final widget = ListViewNumberGen(content);
            listWidget.add(widget);
          }
        }

        if (typeOf == "mcq-break") {
          if (listWidget.isNotEmpty) {
            listOfScreen.add(TheoryType(listofwidget: List.from(listWidget)));
            listWidget.clear();
          }
          final content = value["content"];
          if (content != null) {
            final widget = ListViewMCQGen(content);
            listWidget.add(widget);
          }

          listOfScreen.add(McqType(listofscreen: List.from(listWidget)));
          listWidget.clear();
        }

        if (typeOf == "break") {
          if (listWidget.isNotEmpty) {
            listOfScreen.add(TheoryType(listofwidget: List.from(listWidget)));
            listWidget.clear();
          }
        }
      }
      return listOfScreen;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Widget TextGen(String content, String type, String typeOf) {
    if (type == "heading") {
      return Headingtext(text: content);
    }

    if (type == "paragraph") {
      return Paragraphtext(text: content);
    }

    if (type == "sub-heading") {
      return SubHeadingText(text: content);
    }
    return Headingtext(text: content);
  }

  static Widget CodeGen(String code) {
    return CustomCode(code: code);
  }

  static Widget ListViewPointGen(String content, String type, String typeOf) {
    List<String> items = content.split('\n');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          items.map((item) {
            return Container(
              margin: EdgeInsets.only(left: 13),
              child: Column(
                children: [PointListText(text: item), SizedBox(height: 10)],
              ),
            );
          }).toList(),
    );
  }

  static Widget ListViewNumberGen(var data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          data.map<Widget>((item) {
            final number = item["number"] ?? "";
            final title = item["title"] ?? "";
            final bullets = item["bullets"] ?? [];

            return Container(
              margin: EdgeInsets.only(left: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NumberListText(text: "$title", index: number.toString()),
                  ...bullets.map(
                    (bullet) => Padding(
                      padding: const EdgeInsets.only(left: 20, top: 5),
                      child: PointListText(text: bullet),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            );
          }).toList(),
    );
  }

  static Widget TableViewGen(var data) {
    var mainData = data['body'] as Map<String, dynamic>;
    final head = List<String>.from(mainData["row1"]);
    final body =
        mainData.entries
            .where((data) => data.key != "row1")
            .map((data) => List<String>.from(data.value))
            .toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns:
            head
                .map<DataColumn>(
                  (header) => DataColumn(label: Paragraphtext(text: header)),
                )
                .toList(),
        rows:
            body
                .map(
                  (row) => DataRow(
                    cells:
                        row
                            .map((cell) => DataCell(Paragraphtext(text: cell)))
                            .toList(),
                  ),
                )
                .toList(),
      ),
    );
  }

  static Future<String> getJsonFilePath(String fileName) async {
    var jsonData;

    if (Platform.isAndroid) {
      jsonData = await rootBundle.loadString("assets/json/$fileName.json");
    }

    if (Platform.isWindows) {
      File file = File("$fileName.json");
      final Data = await file.readAsString();
      jsonData = Data;
    }
    return jsonData;
  }
}
