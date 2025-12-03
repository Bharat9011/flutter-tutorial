import 'package:flutter/material.dart';
import 'package:fluttertutorial/custom/AppBarText.dart';
import 'package:fluttertutorial/responsive/responsive.dart';
import 'package:fluttertutorial/screen/flutter_course/introducation_dashboard.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<String> topics = [
    "Flutter Course",
    "Project & Example",
    "Quizzes & Assessments",
    "challenge & Exercies",
    "Community & Discussion",
    "BookMark & Progress",
  ];
  List<String> textEmoji = [
    "📚",
    "💡",
    "✅",
    "🎯",
    "💬",
    "🔖",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: AppBarText(text: "DashBoard"),
        leading: Icon(Icons.menu, color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: topics.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Responsive.isMobile(context) ? 2 : 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                if (topics[index] == "Flutter Course") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IntroducationDashboard(),
                    ),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 6,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textEmoji[index],
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      topics[index],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
