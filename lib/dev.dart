import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Import the Lottie package

class DevScreen extends StatefulWidget {
  @override
  _DevScreenState createState() => _DevScreenState();
}

class _DevScreenState extends State<DevScreen> with SingleTickerProviderStateMixin {
  PageController _pageController = PageController();
  int _currentPage = 0;

  Color _startColor = Colors.cyan;
  Color _endColor = Colors.blue.shade900;
  late AnimationController _colorController;
  late Animation<Color?> _colorTween1;
  late Animation<Color?> _colorTween2;

  void _nextPage() {
    if (_currentPage < 2) {
      setState(() {
        _currentPage++;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _colorController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: true);

    _colorTween1 = ColorTween(begin: Colors.cyan, end: Colors.purple).animate(_colorController);
    _colorTween2 = ColorTween(begin: Colors.blue.shade900, end: const Color.fromARGB(255, 0, 56, 108)).animate(_colorController);

    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _startColor = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
        _endColor = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
      });
    });
  }

  @override
  void dispose() {
    _colorController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Yinna Multi Services'),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _colorController,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [_colorTween1.value ?? _startColor, _colorTween2.value ?? _endColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              );
            },
          ),
          PageView(
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              _buildCompanyInfo(),
              _buildServicesInfo(),
              _buildCopyrightInfo(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildGradientButton('Back', _previousPage),
                  SizedBox(width: 16), // Add space between buttons and dots
                  Row(
                    children: List.generate(3, (index) => _buildDot(index)),
                  ),
                  SizedBox(width: 16), // Add space between dots and buttons
                  _buildGradientButton('Next', _nextPage),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Yinna Multi Services',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 16),
          // Lottie animation
          Lottie.asset(
            'assets/images/animation.json', // Path to your Lottie file
            width: 150,
            height: 150,
          ),
          SizedBox(height: 16),
          Text(
            'Team:',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            'UI/UX Developers:\n- Mr. Oussama Toughzaoui (+2120647674794)\n- Mr. Anass Hajjouj (+2120691459521)',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            'Manager:\n- Mr. BRAHIM MOUSSAOUI',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            'Emails:\n- sgerr66@gmail.com\n- toughzaoui.oussama91@gmail.com',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Our Services',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 16),
          // Lottie animation
          Lottie.asset(
            'assets/images/animation.json', // Path to your Lottie file
            width: 150,
            height: 150,
          ),
          SizedBox(height: 16),
          Text(
            'We specialize in:',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            '- Website Creation\n- Android & iOS Application Development\n- Windows Application Development',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildCopyrightInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          // Lottie animation
          Lottie.asset(
            'assets/images/animation.json', // Path to your Lottie file
            width: 150,
            height: 150,
          ),
          Text(
            'Copyright © 2024',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 16),
          Text(
            'Yinna Multi Services. All rights reserved.',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan, Colors.blue.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: _currentPage == index ? 12 : 8,
      width: _currentPage == index ? 12 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.white : Colors.white.withOpacity(0.5),
        shape: BoxShape.circle,
        boxShadow: _currentPage == index
            ? [BoxShadow(color: Colors.white, blurRadius: 4, spreadRadius: 1)]
            : [],
      ),
    );
  }
}
