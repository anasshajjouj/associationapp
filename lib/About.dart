import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String _content = ""; // Variable to hold the current content
  String _title = ""; // Variable to hold the current title

  @override
  void initState() {
    super.initState();
    // Set the initial content to the first section
    _content = _getAboutAssociationContent();
    _title = "حول الجمعية"; // Set the initial title
  }

  String _getAboutAssociationContent() {
    return 
        "تأسست جمعية الوفاء لمرضى السكري بإقليم ورزازات يوم 2011/01/08 - \n"
        "يدير أعمال الجمعية مكتب مسير ينتخب على رأس كل 3سنوات -\n"
        "يدير أعمال الجمعية مكتب مسير ينتخب على رأس كل 3سنوات -\n"
        "ينعقد جمع عام للمنخرطين 18شهرا يتطوع في عمل الجمعية اطباء ورزازات-\n"
        " تنتمي الجمعية إلى اتحاد جمعيات داء سكري لجهة درعة تافيلالت-\n"
        "الجامعة المغربية لداء السكري مند2011-\n"
        "عقد شراكة مع مؤسسات وطنية وجمعيات وطنيا وجهويا في ميدان السكري-";
  }

  String _getGoalsContent() {
    return 
        "الإكتشاف المبكر لداء السكري-\n"
        "توعية المرضى لمعرفتهم باسباب واخطار السكري وطرق العلاج-\n"
        "مساعدة المرضى السكري والسعي لتحسين حالاتهم الصحية-\n"
        "التعرف على مستجدات مرض السكري-\n"
        "التواصل بين المرضى-\n"
        "العناية الاجتماعية بالمرضى-\n"
        "خلق نادي للمنخرطين-\n"
        "رفع مستوى الخدمات الصحية لصالح المنخرطين-\n"
        "الانتفاخ على جمعيات جهوية . وطنية و دولية-\n"
        "السعي إلى خلق فروع للجمعية-";
  }

  String _getServicesContent() {
    return 
        "خلية دائمة من أعضاء المكتب للتتبع العمل اليومي للجمعية - \n"
        " تتبع المرضى صبيحة كل سبت من طرف طبيب متطوع لفائدة الجمعية - \n"
        " توزيع أدوية مرض السكري بالمجان على المنخرطين - \n"
        " السعي إلى توفير الات قياس نسبة السكر في الدم لجميع المنخرطين-\n"
        " التدخل لدى بعض المختبرات لتخفيض كلفة الخدمات لصالح المنخرطين-\n"
        " فحص شبكة العين مجانا بالمقر (وأمراض العيون)-\n"
        " علاج قدم السكري-\n"
        " اعداد مائدة الإفطار مجانا صبيحة كل يوم سبت للمرضى-\n"
        " القوافل الطبية داخل وخارج الإقليم-\n"
        " الندوات التحسيسية-\n"
        " استقبال جمعيات وطنية و دولية للتعاون وتبادل الخبرات-\n"
        " أنشطة رياضية لترسيخ ثقافة المشي من أجل تحسين جودة العلاج-";
  }

  void _updateContent(String section) {
    setState(() {
      switch (section) {
        case "حول الجمعية":
          _content = _getAboutAssociationContent();
          _title = "حول الجمعية"; // Update title for this section
          break;
        case "أهدافنا":
          _content = _getGoalsContent();
          _title = "أهدافنا"; // Update title for this section
          break;
        case "خدماتنا":
          _content = _getServicesContent();
          _title = "خدماتنا"; // Update title for this section
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      drawer: Drawer(
        child: Container(
          width: 250, // Shortened width for the drawer
          color: Color(0xFFFAF7F0), // Background color for the drawer
          child: Column(
            children: [
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Center the logo at the top of the drawer
                    Image.asset(
                      'assets/images/logo.jpeg', // Path to your logo image
                      height: 80, // Adjust height as needed
                    ),
                    SizedBox(height: 10), // Space between logo and title
                    Text(
                      'التنقل',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    // Adding background and shadow to each ListTile
                    _buildListTile('حول الجمعية'),
                    _buildListTile('أهدافنا'),
                    _buildListTile('خدماتنا'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background image taking full screen
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Start at the top
                children: [
                  SizedBox(height: 20), // Add top margin of 20 pixels
                  // Positioning the logo at the top
                  Image.asset(
                    'assets/images/logo3.png', // Path to your centered logo
                    height: 100, // Adjust the height as needed
                  ),
                  SizedBox(height: 10), // Space between logo and title
                  // Displaying the current section title dynamically
                  Text(
                    _title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10), // Space between title and content
                  Text(
                    "" + _content, // Starting the body text with an asterisk
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      height: 1.5, // Line height for better readability
                    ),
                    textAlign: TextAlign.right, // Align the text to the right
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(String title) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8), // Margin for each card
      elevation: 4, // Shadow effect
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        onTap: () {
          Navigator.pop(context); // Close the drawer
          _updateContent(title);
        },
      ),
    );
  }
}
