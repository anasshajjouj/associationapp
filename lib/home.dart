import 'dart:async';
import 'package:flutter/material.dart';
import 'package:associationapp/contactus.dart';
import 'package:associationapp/dev.dart';
import 'package:associationapp/siteweb.dart';
import 'package:associationapp/webview_screen_activities.dart';
import 'package:associationapp/webview_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'about.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  Color _startColor = Colors.cyan; // Start color
  Color _endColor = Colors.blue.shade900; // End color

  int _pageIndex = 0;

  final List<Widget> _screens = [
    Placeholder(), // Home Screen placeholder for the card grid
    AboutScreen(),
    WebViewScreen(url: 'https://associationalwafa.com/'),
    WebViewScreenActivities(url: 'https://associationalwafa.com/category/%d8%a3%d9%86%d8%b4%d8%b7%d8%aa%d9%86%d8%a7/'),
    ContactUsScreen(),
    DevScreen(),
  ];

  @override
  void initState() {
    super.initState();

    // Set up a timer to change the colors smoothly between cyan and dark blue
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        // Change colors every 3 seconds
        if (_startColor == const Color.fromARGB(255, 249, 249, 249)) {
          _startColor = const Color.fromARGB(255, 167, 167, 167);
          _endColor = const Color.fromARGB(255, 255, 255, 255);
        } else {
          _startColor = const Color.fromARGB(255, 255, 255, 255);
          _endColor = const Color.fromARGB(255, 147, 147, 147);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 3),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [_startColor, _endColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          
          Positioned(
            top: 0,
            left: 100,
            child: Image.asset(
              'assets/images/logo1.png',
              width: 200,
              height: 200,
            ),
          ),
          IndexedStack(
            index: _pageIndex,
            children: [
              _buildHomePage(),
              ..._screens.sublist(1), // Other screens based on selected index
            ],
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 32,
        backgroundColor: Colors.transparent,
        color: Colors.black, // Set the color of the navigation bar to black
        items: [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.info, size: 30, color: Colors.white),
          Icon(Icons.web, size: 30, color: Colors.white),
          Icon(Icons.category, size: 30, color: Colors.white),
          Icon(Icons.contact_phone, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        index: _pageIndex,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildHomePage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 150),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _buildGradientCard(
                  context,
                  'assets/images/about.png',
                  'حول الجمعية',
                  'À propos',
                  Colors.purple,
                  Colors.pink,
                  1, // Index for AboutScreen
                ),
                _buildGradientCard(
                  context,
                  'assets/images/service.png',
                  'خدمات الجمعية',
                  'Services',
                  Colors.blue,
                  Colors.cyan,
                  2, // Index for WebViewScreen (services)
                ),
                _buildGradientCard(
                  context,
                  'assets/images/activities.png',
                  'انشطة الجمعية',
                  'Activités',
                  Colors.orange,
                  Colors.red,
                  3, // Index for WebViewScreenActivities (activities)
                ),
                _buildGradientCard(
                  context,
                  'assets/images/website.png',
                  'موقع الجمعية',
                  'Site Web',
                  Colors.green,
                  Colors.teal,
                  2, // Index for WebViewScreen (website)
                ),
                _buildGradientCard(
                  context,
                  'assets/images/call.png',
                  'اتصل بالجمعية',
                  'Contact',
                  Colors.yellow,
                  Colors.amber,
                  4, // Index for ContactUsScreen
                ),
                _buildGradientCard(
                  context,
                  'assets/images/programmer.png',
                  'مبرمج التطبيق',
                  'Développeur',
                  Colors.indigo,
                  Colors.deepPurple,
                  5, // Index for DevScreen
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientCard(
    BuildContext context,
    String imagePath,
    String arabicText,
    String frenchText,
    Color startColor,
    Color endColor,
    int pageIndex, // Page index for navigation
  ) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3, // Adjusted elevation for smaller shadow
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.purpleAccent.withOpacity(0.6), // Adjusted shadow opacity
              blurRadius: 10, // Smaller softness of the shadow
              spreadRadius: 2, // Smaller spread of the shadow
              offset: Offset(0, 4), // Positioning of the shadow
            ),
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.4), // Another neon color for depth
              blurRadius: 10,
              spreadRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              _pageIndex = pageIndex; // Update the page index
            });
          },
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      arabicText,
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      frenchText,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Image.asset(
                  imagePath,
                  width: 80,
                  height: 80,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
