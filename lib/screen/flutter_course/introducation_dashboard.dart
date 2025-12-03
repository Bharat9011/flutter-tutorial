import 'package:flutter/material.dart';
import 'package:fluttertutorial/custom/AppBarText.dart';
import 'package:fluttertutorial/screen/flutter_course/show_content.dart';

class IntroducationDashboard extends StatefulWidget {
  const IntroducationDashboard({super.key});

  @override
  State<IntroducationDashboard> createState() => _IntroducationDashboardState();
}

class _IntroducationDashboardState extends State<IntroducationDashboard> {
  List<bool> expansionSelected = [];

  Map<String, List<String>> topics = {
    "Introduction": [
      "Introduction:This section provides an overview of the Flutter framework, its features, and its advantages for mobile app development.",
      "Installation:Follow the steps below to install and set up the project on your local machine.",
      "Project Structure:This section provides a clear overview of the folder and file organization used in the app, helping you easily navigate and manage the project. ",
      "First Application:This is the basic structure of your first Flutter application, organized for easy understanding and development. ",
      "Architcuture:This section explains the core structure and flow of the application, outlining how different parts of the project work together.",
      "Flutter vs Other Android FramkWork:This section compares Flutter with other Android development frameworks, highlighting differences in performance, development speed, and flexibility.",
    ],
    "Dart Basics": [
      "Introduction, Variables, Data Types:This section covers the basics of Flutter, including an introduction to the language, how to declare variables, and the different data types available.",
      "Functions:This section explains how to create and use functions in Flutter to organize and reuse code efficiently.",
      "Control Flow (if-else, loops):This section covers how to control the flow of your Flutter app using conditional statements (if-else) and loops to repeat tasks.",
      "Collections:This section explores Flutter's collection types, such as lists, sets, and maps, and how to use them to store and manage multiple values efficiently.",
      "Null Safety:This section explains Flutter’s null safety feature, ensuring that variables are non-nullable by default and reducing the risk of runtime errors.",
    ],
    "Flutter Fundamentals": [
      "Flutter App Structure:This section outlines the typical structure of a Flutter app, including the organization of directories and files for better code management and scalability.",
      "Stateless vs Stateful Widgets:This section explains the difference between Stateless and Stateful Widgets in Flutter, helping you understand when to use each based on whether the widget's state needs to change during its lifecycle.",
      "Widgets Deep Dive:This section takes a deeper look into Flutter’s widget system, exploring how widgets work, their lifecycle, and how to use them effectively to build dynamic and responsive UIs.",
      "Navigation & Routing:This section covers how to navigate between different screens in a Flutter app, including the use of named routes and passing data between screens.",
      "Layouts and Constraints:This section explains how to create responsive layouts in Flutter using various layout widgets, such as Row, Column, Stack, and Container, and how to manage constraints for better UI design.",
      "Forms & Validation:This section covers how to create forms in Flutter, including text fields, checkboxes, and radio buttons, as well as how to validate user input to ensure data integrity.",
      "State Management (Basic):This section introduces basic state management techniques in Flutter, including setState and lifting state up, to manage the state of your app effectively.",
      "Assets & Media:This section explains how to manage and use assets in Flutter, including images, fonts, and other media files, to enhance the visual appeal of your app.",
      "Themes & Styling:This section covers how to apply themes and styles in Flutter, including customizing colors, fonts, and other visual elements to create a consistent look and feel across your app.",
      "Project:Build a Mini App This section guides you through building a mini app using the concepts learned so far, providing hands-on experience in applying Flutter fundamentals.",
    ],
    "Custom Widgets": [
      "Basics of Custom Widgets:This section introduces the concept of custom widgets in Flutter, explaining how to create reusable components to enhance code organization and maintainability.",
      "Stateless vs Stateful Custom Widgets:This section explains the difference between Stateless and Stateful custom widgets, helping you understand when to use each type based on the widget's state requirements.",
      "Widget Composition:This section covers how to compose custom widgets using existing widgets, allowing you to build complex UIs by combining simpler components.",
      "Custom Widget Parameters (Properties):This section explains how to define and use parameters (properties) in custom widgets, enabling you to pass data and customize the behavior of your widgets.",
      "Reusability & Best Practices:This section discusses best practices for creating reusable custom widgets in Flutter, including naming conventions, documentation, and code organization.",
      "Custom Paint & Render Objects:This section introduces the concept of custom painting in Flutter, explaining how to create custom graphics and animations using the CustomPaint widget and RenderObjects.",
      "InheritedWidget & Context Access:This section explains how to use InheritedWidget to share data across the widget tree, allowing for efficient state management and context access.",
      "Custom Layout Widgets:This section covers how to create custom layout widgets in Flutter, enabling you to design unique and complex layouts that are not achievable with standard widgets.",
      "Testing Custom Widgets:This section discusses how to test custom widgets in Flutter, including unit tests and widget tests, to ensure the reliability and correctness of your components.",
    ],
    "Responsive & Adaptive UI": [
      "Responsive UI:This section covers how to create responsive UIs in Flutter that adapt to different screen sizes and orientations, ensuring a consistent user experience across devices.",
      "Adaptive UI:This section explains how to build adaptive UIs in Flutter that adjust their layout and design based on the platform (iOS, Android, Web) to provide a native look and feel.",
      "Advanced Techniques:This section explores advanced techniques for building responsive and adaptive UIs in Flutter, including using MediaQuery, LayoutBuilder, and custom breakpoints.",
      "Tools & Packages:This section introduces various tools and packages available in Flutter to assist in building responsive and adaptive UIs, such as flutter_screenutil and responsive_builder.",
    ],
    "State Management": [
      "Local State Management:This section covers local state management techniques in Flutter, including setState and lifting state up, to manage the state of individual widgets effectively.",
      "Global State Management (App State):This section explains global state management techniques in Flutter, including Provider and Riverpod, to manage the state of the entire app efficiently.",
      "State Restoration:This section discusses state restoration in Flutter, explaining how to save and restore the state of your app during app lifecycle events, such as backgrounding and termination.",
      "Scoped Model:This section introduces the Scoped Model pattern in Flutter, explaining how to manage state using a model class that provides data and methods to the widget tree.",
      "InheritedWidget & ChangeNotifier:This section explains how to use InheritedWidget and ChangeNotifier for state management in Flutter, allowing you to share data and notify widgets of changes efficiently.",
      "Comparison of State Management Approaches:This section compares different state management approaches in Flutter, including setState, Provider, Riverpod, and BLoC, helping you choose the right one for your app.",
      "Best Practices in State Management:This section discusses best practices for state management in Flutter, including code organization, performance optimization, and avoiding common pitfalls.",
    ],
    "Local Storage": [
      "Shared Preferences:This section covers how to use Shared Preferences in Flutter for simple key-value storage, allowing you to save user preferences and settings easily.",
      "SQLite Database:This section explains how to use SQLite in Flutter for local database storage, enabling you to manage structured data efficiently.",
      "File Storage:This section discusses how to use file storage in Flutter to save and retrieve files, such as images and documents, on the device.",
      "Hive:This section introduces Hive, a lightweight and fast NoSQL database for Flutter, explaining how to use it for local data storage.",
      "ObjectBox:This section covers ObjectBox, a high-performance NoSQL database for Flutter, explaining how to use it for local data storage and management.",
      "Isar Database:This section introduces Isar, a fast and efficient database for Flutter, explaining how to use it for local data storage and management.",
    ],
    "Device Integration": [
      "Hardware Sensors & Features:This section covers how to access and use hardware sensors and features in Flutter, such as the camera, GPS, and accelerometer, to enhance app functionality.",
      "Connectivity & Networking:This section explains how to manage network connectivity in Flutter, including checking network status and handling offline scenarios.",
      "Storage & File Access:This section discusses how to access and manage device storage and files in Flutter, including reading and writing files, and managing permissions.",
      "Device APIs & Platform Channels:This section introduces platform channels in Flutter, explaining how to communicate with native device APIs and access platform-specific features.",
      "Media & Notifications:This section covers how to manage media playback and notifications in Flutter, including audio, video, and push notifications.",
      "Peripheral Devices:This section explains how to connect and interact with peripheral devices in Flutter, such as Bluetooth devices and external sensors.",
      "Platform-Specific Integrations:This section discusses how to implement platform-specific integrations in Flutter, including using native code for iOS and Android to access platform-specific features.",
    ],
    "Networking & JSON": [
      "Networking in Flutter:This section covers how to make network requests in Flutter, including using the http package to fetch data from APIs.",
      "JSON Handling in Flutter:This section explains how to parse and handle JSON data in Flutter, including converting JSON to Dart objects and vice versa.",
      "State Management with API Data:This section discusses how to manage state in Flutter when working with API data, including using state management libraries like Provider and Riverpod.",
      "Advanced Topics:This section covers advanced networking topics in Flutter, including error handling, caching, and optimizing network requests.",
    ],
    "Connectivity Handling": [
      "Checking Network Connectivity:This section covers how to check network connectivity in Flutter, including using the connectivity package to monitor network status.",
      "Listening to Connectivity Changes:This section explains how to listen for connectivity changes in Flutter, allowing your app to respond to network status changes in real-time.",
      "Detecting Real Internet Access (Beyond Just Network Availability):This section discusses how to detect real internet access in Flutter, including checking for actual data connectivity and not just network availability.",
      "Handling Offline Scenarios:This section covers how to handle offline scenarios in Flutter, including caching data and providing offline functionality.",
      "Optimizing Network Calls:This section explains how to optimize network calls in Flutter, including using background fetch and optimizing data fetching strategies.",
      "State Management for Connectivity:This section discusses how to manage connectivity state in Flutter, including using state management libraries to handle network status changes.",
      "Testing Connectivity Handling:This section covers how to test connectivity handling in Flutter, including unit tests and integration tests for network-related functionality.",
      "Common Pitfalls & Best Practices:This section discusses common pitfalls and best practices for handling connectivity in Flutter, including managing permissions and optimizing performance.",
    ],
    "Firebase Integration": [
      "Firebase Setup & Configuration:This section covers how to set up and configure Firebase in your Flutter app, including creating a Firebase project and adding necessary dependencies.",
      "Firebase Core Setup:This section explains how to set up Firebase Core in your Flutter app, including initializing Firebase and configuring necessary services.",
      "Firebase Authentication:This section covers how to implement Firebase Authentication in your Flutter app, including email/password authentication and social media sign-in.",
      "Firebase Realtime Database:This section explains how to use Firebase Realtime Database in your Flutter app, including reading and writing data in real-time.",
      "Cloud Firestore:This section covers how to use Cloud Firestore in your Flutter app, including querying and managing data in a NoSQL database.",
      "Firebase Storage:This section explains how to use Firebase Storage in your Flutter app, including uploading and downloading files.",
      "Firebase Cloud Messaging (FCM):This section covers how to implement Firebase Cloud Messaging in your Flutter app, including sending and receiving push notifications.",
      "Firebase Analytics & Crashlytics:This section explains how to use Firebase Analytics and Crashlytics in your Flutter app, including tracking user behavior and handling crashes.",
      "Firebase Remote Config:This section covers how to use Firebase Remote Config in your Flutter app, including managing app configurations and feature flags.",
      "Firebase Dynamic Links:This section explains how to use Firebase Dynamic Links in your Flutter app, including creating and managing deep links.",
      "Firebase Security & Rules:This section covers how to implement security rules in Firebase for your Flutter app, including managing user access and data security.",
      "Testing & Debugging Firebase in Flutter:This section discusses how to test and debug Firebase integration in your Flutter app, including using Firebase Test Lab and debugging common issues.",
      "Deployment & Monitoring:This section covers how to deploy your Flutter app with Firebase integration, including monitoring performance and user engagement using Firebase tools.",
    ],
    "Animations and UI Effects": [
      "Basic Animations:This section covers the basics of animations in Flutter, including how to create simple animations using the AnimationController and Tween classes.",
      "Advanced Animations:This section explains advanced animation techniques in Flutter, including using the AnimatedBuilder and AnimatedWidget classes for more complex animations.",
      "Staggered Animations:This section covers how to create staggered animations in Flutter, allowing you to animate multiple widgets in a sequence.",
      "Hero Animations:This section explains how to implement Hero animations in Flutter, allowing you to create smooth transitions between screens.",
      "Page Transitions & Navigation Animations:This section covers how to create custom page transitions and navigation animations in Flutter, enhancing the user experience during navigation.",
      "Animated Widgets & Libraries:This section introduces various animated widgets and libraries available in Flutter, including the Lottie library for complex animations.",
      "Scroll-Based Animations:This section explains how to create scroll-based animations in Flutter, allowing you to animate widgets based on scroll position.",
      "Shaders & Visual Effects:This section covers how to use shaders and visual effects in Flutter, including creating custom shaders for unique visual effects.",
      "Micro-interactions & Feedback Animations:This section explains how to implement micro-interactions and feedback animations in Flutter, enhancing user engagement and providing visual feedback.",
      "Performance Optimization for Animations:This section discusses how to optimize animations in Flutter for better performance, including using the const keyword and avoiding unnecessary rebuilds.",
      "Animations in Custom Widgets:This section covers how to implement animations in custom widgets in Flutter, allowing you to create dynamic and interactive components.",
    ],
    "App Architecture": [
      "UI Architecture Patterns:This section covers various UI architecture patterns in Flutter, including MVC, MVVM, and Clean Architecture, helping you choose the right pattern for your app.",
      "Widget Tree & Composition:This section explains the widget tree structure in Flutter and how to compose widgets effectively for better code organization.",
      "State Management:This section discusses different state management approaches in Flutter, including setState, Provider, Riverpod, and BLoC, helping you manage app state efficiently.",
      "Performance Optimization for UI:This section covers performance optimization techniques for UI in Flutter, including using const constructors, avoiding unnecessary rebuilds, and optimizing widget trees.",
      "Theming & Design Systems:This section explains how to implement theming and design systems in Flutter, allowing you to create consistent and visually appealing UIs.",
      "Dependency Injection:This section covers dependency injection in Flutter, including using packages like GetIt and Provider for managing dependencies.",
    ],
    "Gesture & Interaction": [
      "Basic Gestures:This section covers the basics of gestures in Flutter, including tap, double-tap, long press, and drag gestures.",
      "Advanced Gestures:This section explains advanced gesture handling in Flutter, including multi-touch gestures and custom gesture recognizers.",
      "Gesture Detector:This section covers how to use the GestureDetector widget in Flutter to handle user interactions and gestures.",
      "InkWell & Material Touch Responses:This section explains how to use the InkWell widget in Flutter to create touch feedback and material design interactions.",
      "Dismissible Widget (Swipe to Dismiss):This section covers how to implement the Dismissible widget in Flutter, allowing users to swipe to dismiss items in a list.",
      "Draggable & DragTarget:This section explains how to use the Draggable and DragTarget widgets in Flutter to implement drag-and-drop functionality.",
      " InteractiveViewer (Zoom & Pan):This section covers how to use the InteractiveViewer widget in Flutter to implement zoom and pan functionality for interactive content.",
      "Scroll & Touch Physics:This section explains how to customize scroll and touch physics in Flutter, allowing you to create smooth and responsive scrolling experiences.",
      "RawGestureDetector & Custom Gestures:This section covers how to use the RawGestureDetector widget in Flutter to create custom gestures and handle low-level touch events.",
      "Pointer Events & Hit Testing:This section explains how to handle pointer events and hit testing in Flutter, allowing you to manage touch interactions at a low level.",
      "Mouse & Keyboard Interactions:This section covers how to handle mouse and keyboard interactions in Flutter, including implementing hover effects and keyboard shortcuts.",
      "Pointer Interactions (Desktop & Web):This section explains how to handle pointer interactions in Flutter for desktop and web platforms, including mouse events and touch events.",
      "Touch Feedback & Visual Responses:This section covers how to implement touch feedback and visual responses in Flutter, enhancing user engagement and providing visual cues during interactions.",
      "Gesture Recognizers:This section explains how to use gesture recognizers in Flutter to create custom gestures and handle complex interactions.",
    ],
    "Notifications": [
      "Overview of Notifications:This section provides an overview of notifications in Flutter, including their purpose and importance in mobile applications.",
      "Built-in Notification Types:This section covers the built-in notification types available in Flutter, including local notifications and push notifications.",
      "Custom Notifications:This section explains how to create custom notifications in Flutter, allowing you to tailor notifications to your app's specific needs.",
      "Handling Notifications:This section covers how to handle notifications in Flutter, including responding to user interactions and managing notification states.",
      "Bubbling & Propagation:This section explains how notification bubbling and propagation work in Flutter, allowing you to manage notification events across the widget tree.",
      "Use Cases:This section discusses various use cases for notifications in Flutter, including user engagement, reminders, and alerts.",
      "Difference Between Notifications & Other Communication Methods:This section explains the differences between notifications and other communication methods in Flutter, including in-app messages and alerts.",
      "Best Practices for Notifications:This section covers best practices for implementing notifications in Flutter, including user preferences, frequency, and content.",
    ],
    "Testing & Debugging": [
      "Types of Testing in Flutter:This section covers the different types of testing in Flutter, including unit tests, widget tests, and integration tests.",
      "Flutter Testing Tools & Frameworks:This section explains the various testing tools and frameworks available in Flutter, including the Flutter testing library and third-party packages.",
      "Debugging Techniques:This section covers debugging techniques in Flutter, including using the Flutter DevTools, logging, and error handling.",
      "Handling Errors & Exceptions:This section explains how to handle errors and exceptions in Flutter, including using try-catch blocks and error boundaries.",
      "Performance Debugging:This section covers performance debugging techniques in Flutter, including using the Flutter performance overlay and profiling tools.",
      "Automated Testing Strategies:This section explains automated testing strategies in Flutter, including continuous integration and deployment (CI/CD) practices.",
    ],
    "Deploying the App": [
      "Preparing for Deployment:This section covers the steps to prepare your Flutter app for deployment, including optimizing assets and code.",
      "Building the App for Different Platforms:This section explains how to build your Flutter app for different platforms, including iOS, Android, web, and desktop.",
      "Publishing to App Stores:This section covers the process of publishing your Flutter app to app stores, including the Google Play Store and Apple App Store.",
      "Deploying to Web:This section explains how to deploy your Flutter app to the web, including hosting options and configuration.",
      "Continuous Integration & Deployment (CI-CD):This section covers how to set up continuous integration and deployment (CI/CD) for your Flutter app, including using tools like GitHub Actions and Travis CI.",
      "Post-Deployment Tasks:This section discusses post-deployment tasks for your Flutter app, including monitoring performance, user feedback, and updates.",
    ],
    "Final AapStone Projects": [
      "E-Commerce & Shopping Apps:This section covers the development of e-commerce and shopping apps using Flutter, including product listings, cart management, and payment integration.",
      "Social Media & Networking:This section explains how to build social media and networking apps using Flutter, including user profiles, feeds, and messaging features.",
      "Health & Fitness:This section covers the development of health and fitness apps using Flutter, including activity tracking, workout plans, and health data integration.",
      "Education & E-Learning:This section explains how to build education and e-learning apps using Flutter, including course management, quizzes, and user progress tracking.",
      "Finance & Banking:This section covers the development of finance and banking apps using Flutter, including budgeting, transactions, and account management.",
      "Travel & Tourism:This section explains how to build travel and tourism apps using Flutter, including booking systems, itineraries, and location-based services.",
      "Entertainment & Media:This section covers the development of entertainment and media apps using Flutter, including video streaming, music players, and content management.",
    ],
  };

  @override
  void initState() {
    super.initState();
    if (expansionSelected.isEmpty && topics.keys.isNotEmpty) {
      expansionSelected = List<bool>.filled(topics.keys.length, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarText(text: "Topic Flutter"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF1A1A2E)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: topics.length,
          itemBuilder: (context, index) {
            String key = topics.keys.elementAt(index);
            List<String> subTopics = topics[key]!;

            return Card(
              color: Colors.transparent,
              elevation: 4,
              shadowColor: Colors.blueAccent.withOpacity(0.3),
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Theme(
                data: Theme.of(
                  context,
                ).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  leading: Icon(Icons.play_arrow, color: Colors.white),
                  backgroundColor: Colors.grey.shade900.withOpacity(0.4),
                  collapsedBackgroundColor: Colors.grey.shade800.withOpacity(
                    0.3,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  title: Text(
                    key,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(color: Colors.blueAccent, blurRadius: 10),
                      ],
                    ),
                  ),
                  trailing: Icon(
                    expansionSelected[index]
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  onExpansionChanged: (val) {
                    setState(() {
                      expansionSelected[index] = val;
                    });
                  },
                  children:
                      subTopics.map((val) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          ShowContent(topic: val.split(":")[0]),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(15),
                            splashColor: Colors.blue.withOpacity(0.3),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blueAccent.withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.track_changes,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          val.split(":")[0],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          val.split(":")[1],
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
