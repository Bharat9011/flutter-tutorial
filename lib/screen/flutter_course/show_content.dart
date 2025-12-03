import 'package:flutter/material.dart';
import 'package:fluttertutorial/utility/observer/jsonobserver.dart';
import 'package:confetti/confetti.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:math';

class ShowContent extends StatefulWidget {
  ShowContent({super.key, this.topic});

  final String? topic;

  @override
  State<ShowContent> createState() => _ShowContentState();
}

class _ShowContentState extends State<ShowContent> {
  late List<Widget> getData = [];
  PageController controllerPage = PageController(initialPage: 0);
  int currentPageIndex = 0;
  late ConfettiController _confettiController;
  final FlutterTts flutterTts = FlutterTts();
  bool isSpeaking = false;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );
    _loadProgress();
    setData();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    flutterTts.stop();
    controllerPage.dispose();
    super.dispose();
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final savedPage = prefs.getInt('progress_${widget.topic}') ?? 0;
    if (savedPage > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (controllerPage.hasClients) {
          controllerPage.jumpToPage(savedPage);
          setState(() {
            currentPageIndex = savedPage;
          });
        }
      });
    }
  }

  Future<void> _saveProgress(int page) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('progress_${widget.topic}', page);
  }

  void setData() async {
    await Jsonobserver.GetJsonValue(widget.topic!).then((val) {
      setState(() {
        getData = val;
      });
      // Re-apply saved page if data loaded after _loadProgress
      _loadProgress();
    });
  }

  Future<void> _speak(String text) async {
    if (isSpeaking) {
      await flutterTts.stop();
      setState(() => isSpeaking = false);
    } else {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1.0);
      await flutterTts.speak(text);
      setState(() => isSpeaking = true);
      flutterTts.setCompletionHandler(() {
        setState(() => isSpeaking = false);
      });
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      currentPageIndex = index;
    });
    _saveProgress(index);
    if (index == getData.length - 1) {
      _confettiController.play();
    }
  }

  void _nextPage() {
    if (currentPageIndex < getData.length - 1) {
      controllerPage.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
    }
  }

  void _previousPage() {
    if (currentPageIndex > 0) {
      controllerPage.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _showTableOfContents() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder:
          (context) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Table of Contents",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: getData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              currentPageIndex == index
                                  ? Colors.green
                                  : Colors.grey[300],
                          child: Text(
                            "${index + 1}",
                            style: TextStyle(
                              color:
                                  currentPageIndex == index
                                      ? Colors.white
                                      : Colors.black,
                            ),
                          ),
                        ),
                        title: Text("Section ${index + 1}"),
                        onTap: () {
                          Navigator.pop(context);
                          controllerPage.jumpToPage(index);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double progressValue =
        getData.isEmpty ? 0.0 : (currentPageIndex + 1) / getData.length;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.topic ?? "Course",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            LinearProgressIndicator(
              value: progressValue,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              minHeight: 4,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              isSpeaking ? Icons.volume_up : Icons.volume_up_outlined,
              color: Colors.black,
            ),
            onPressed:
                () => _speak(
                  "Reading content for section ${currentPageIndex + 1}",
                ), // Placeholder text, ideally extract text from widget
          ),
          IconButton(
            icon: Icon(Icons.list, color: Colors.black),
            onPressed: _showTableOfContents,
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView(
            controller: controllerPage,
            onPageChanged: _onPageChanged,
            physics: BouncingScrollPhysics(),
            children: getData,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2,
              maxBlastForce: 5,
              minBlastForce: 2,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.1,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: currentPageIndex > 0 ? _previousPage : null,
              icon: Icon(Icons.arrow_back_ios, size: 16),
              label: Text("Previous"),
              style: TextButton.styleFrom(foregroundColor: Colors.grey[800]),
            ),
            Text(
              "${currentPageIndex + 1} / ${getData.length}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            ElevatedButton.icon(
              onPressed: _nextPage,
              icon: Icon(
                currentPageIndex == getData.length - 1
                    ? Icons.check
                    : Icons.arrow_forward_ios,
                size: 16,
              ),
              label: Text(
                currentPageIndex == getData.length - 1 ? "Finish" : "Next",
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
