import 'package:flutter/material.dart';

class McqType extends StatefulWidget {
  McqType({super.key,this.listofscreen});

  List<Widget>? listofscreen;

  @override
  State<McqType> createState() => _McqTypeState();
}

class _McqTypeState extends State<McqType> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Widget>>(
          future: Future.value(widget.listofscreen),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Something went wrong. Please try again."));
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return Container(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: snapshot.data!.map((widget) {
                      return widget;
                    }).toList(),
                  ),
                ),
              );
            } else {
              return Center(child: Text("No content available"));
            }
          },
        );
  }
}