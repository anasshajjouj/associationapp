import 'package:associationapp/contactus.dart';
import 'package:associationapp/webview_screen_activities.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher
import 'about.dart';  // Import the AboutScreen
import 'webview_screen.dart';  // Import the WebViewScreen for the Services card

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image (splash image)
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash.png', // Updated background image path
              fit: BoxFit.cover, // Make sure the background covers the entire screen
            ),
          ),

          // Logo positioned at the top-left corner
          Positioned(
            top: 0,  // Adjust as needed for padding from the top
            left: 100, // Adjust as needed for padding from the left
            child: Image.asset(
              'assets/images/logo1.png', // Logo path
              width: 200, // Adjust the width of the logo
              height: 200, // Adjust the height of the logo
            ),
          ),

          // Cards layout (2 cards per row)
          Padding(
            padding: const EdgeInsets.all(16.0), // Padding for the content
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150), // Space from the top for the logo and background
                // Grid of cards
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2, // 2 cards per row
                    crossAxisSpacing: 10, // Horizontal space between cards
                    mainAxisSpacing: 10, // Vertical space between cards
                    children: [
                      // About Card
                      _buildGradientCard(
                        context,
                        'assets/images/about.png',
                        'حول الجمعية',
                        'À propos',
                        Colors.purple,
                        Colors.pink,
                        AboutScreen(), // Navigate to AboutScreen
                      ),
                      // Services Card with WebView
                      _buildGradientCard(
                        context,
                        'assets/images/service.png',
                        'خدمات الجمعية',
                        'Services',
                        Colors.blue,
                        Colors.cyan,
                        WebViewScreen(url: 'https://associationalwafa.com/'), // Navigate to WebViewScreen with URL
                      ),
                      _buildGradientCard(
                        context,
                        'assets/images/activities.png',
                        'انشطة الجمعية',
                        'Activités',
                        Colors.orange,
                        Colors.red,
                        WebViewScreenActivities(url: 'https://associationalwafa.com/category/%d8%a3%d9%86%d8%b4%d8%b7%d8%aa%d9%86%d8%a7/'), // Navigate to WebView for activities
                      ),
                      // Website Card
                      _buildGradientCard(
                        context,
                        'assets/images/website.png',
                        'موقع الجمعية',
                        'Site Web',
                        Colors.green,
                        Colors.teal,
                        null, // No target screen for now
                        openWebsite: true, // New parameter to indicate opening the website
                      ),
                      _buildGradientCard(
                        context,
                        'assets/images/call.png',
                        'اتصل بالجمعية',
                        'Contact',
                        Colors.yellow,
                        Colors.amber,
                        ContactUsScreen(), // No target screen for now
                      ),
                      _buildGradientCard(
                        context,
                        'assets/images/programmer.png',
                        'مبرمج التطبيق',
                        'Développeur',
                        Colors.indigo,
                        Colors.deepPurple,
                        null, // No target screen for now
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build a card with gradient background, Arabic and French text, and image
  Widget _buildGradientCard(BuildContext context, String imagePath, String arabicText, String frenchText, Color startColor, Color endColor, Widget? targetScreen, {bool openWebsite = false}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      elevation: 5, // Shadow for the card
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Rounded corners for the gradient
          gradient: LinearGradient(
            colors: [startColor, endColor], // Gradient from startColor to endColor
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: InkWell(
          onTap: () {
            if (openWebsite) {
              // Open the website in the external browser
              _launchURL('https://associationalwafa.com/');
            } else if (targetScreen != null) {
              // Navigate to the target screen if provided
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => targetScreen),
              );
            } else {
              print('$arabicText card clicked'); // Handle card click without navigation
            }
          },
          child: Stack(
            children: [
              // The text and image content
              Padding(
                padding: const EdgeInsets.all(12.0), // Padding around the text
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Arabic text
                    Text(
                      arabicText,
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5), // Space between Arabic and French text

                    // French text
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

              // Image on the bottom-right of the card
              Positioned(
                bottom: 10,
                right: 10,
                child: Image.asset(
                  imagePath,
                  width: 80, // Adjust size of the image
                  height: 80,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to launch a URL in an external browser
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url); // Open the URL in the default browser
    } else {
      throw 'Could not launch $url'; // Handle the error if the URL cannot be launched
    }
  }
}
