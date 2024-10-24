import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent resizing when keyboard appears
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/splashcontact.png', // Background image path
              fit: BoxFit.cover, // Make sure the background covers the entire screen
            ),
          ),

          // Logo positioned at the top
          Positioned(
            top: 40, // Adjust as needed for padding from the top
            left: MediaQuery.of(context).size.width * 0.25, // Center the logo horizontally
            child: Image.asset(
              'assets/images/logo1.png', // Logo path
              width: 150, // Smaller logo width
              height: 150, // Smaller logo height
            ),
          ),

          // Center content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Padding around the content
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center the form content vertically
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min, // Prevent unnecessary height
                children: [
                  // Header Text with background color and border
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF536493), // Background color
                      border: Border.all(
                        color: Colors.white, // Border color
                        width: 2, // Border width
                      ),
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12), // Smaller padding
                    child: Text(
                      'اتصل بنا',
                      style: TextStyle(
                        fontSize: 20, // Smaller font size
                        color: Colors.white, // Text color
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center, // Center the text
                    ),
                  ),
                  SizedBox(height: 15), // Space between header and contact info

                  // Contact Information
                  Text(
                    'الهاتف: +212661763893\n'
                    'الإيميل: contact@associationalwafa.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.rtl, // Right-to-left text direction
                  ),
                  SizedBox(height: 10), // Smaller space between text and input fields

                  // Email TextField
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'البريد الإلكتروني',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress, // Email keyboard
                  ),
                  SizedBox(height: 10), // Smaller space between email and subject fields

                  // Subject TextField
                  TextField(
                    controller: subjectController,
                    decoration: InputDecoration(
                      labelText: 'الموضوع',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10), // Smaller space between subject and message fields

                  // Message TextField
                  TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      labelText: 'الرسالة',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3, // Shorter message field
                  ),
                  SizedBox(height: 15), // Smaller space between message and button

                  // Send Button
                  ElevatedButton(
                    onPressed: () {
                      _sendEmail();
                    },
                    child: Text(
                      'ارسال',
                      style: TextStyle(
                        fontSize: 16, // Smaller font size for button text
                        color: Colors.white, // Text color for the button
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button color
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24), // Button padding
                      textStyle: TextStyle(fontSize: 18), // Button text size
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to send email
  void _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'contact@associationalwafa.com',
      query: Uri.encodeFull('subject=${subjectController.text}&body=${messageController.text}'), // Include subject and body
    );

    // Check if we can launch the email app
    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      print('Could not launch email app'); // Handle the error here
    }
  }
}
