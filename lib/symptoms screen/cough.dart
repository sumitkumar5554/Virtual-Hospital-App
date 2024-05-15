import 'package:flutter/material.dart';

class CoughSymptomsPage extends StatefulWidget {
  const CoughSymptomsPage({Key? key}) : super(key: key);

  @override
  _CoughSymptomsPageState createState() => _CoughSymptomsPageState();
}

class _CoughSymptomsPageState extends State<CoughSymptomsPage> {
  bool _isEnglish = false;

  void _toggleLanguage() {
    setState(() {
      _isEnglish = !_isEnglish;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Title translations
    final List<Map<String, String>> titleTranslations = [
      {'hi': 'खांसी के लक्षण', 'en': 'Cough Symptoms'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(titleTranslations[0][_isEnglish ? 'en' : 'hi']!),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: _toggleLanguage,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SymptomTile(
              title: '1. सूखी खांसी - Dry cough:',
              descriptionHindi:
              'सूखी खांसी को खांसने के दौरान बलगम की कोई व्याख्या नहीं होती है।',
              descriptionEnglish:
              'Dry cough is characterized by the absence of phlegm during coughing.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '2. गले में खराश - Sore throat:',
              descriptionHindi:
              'खांसी के साथ गले में खराश और दर्द हो सकता है।',
              descriptionEnglish:
              'There may be throat irritation and pain along with coughing.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '3. बलगम - Phlegm:',
              descriptionHindi:
              'खांसी के साथ बलगम का उत्पादन हो सकता है, जो गले में जमा हो सकता है।',
              descriptionEnglish:
              'Phlegm production may occur with coughing, which can accumulate in the throat.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '4. सांसों में तकलीफ - Shortness of breath:',
              descriptionHindi:
              'खांसी के दौरान बढ़ती तकलीफ की स्थिति हो सकती है।',
              descriptionEnglish:
              'There may be an increased difficulty in breathing during coughing.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '5. दर्द या दबाव - Chest pain or pressure:',
              descriptionHindi:
              'कुछ लोगों को खांसी के दौरान छाती में दर्द या दबाव महसूस हो सकता है।',
              descriptionEnglish:
              'Some people may experience chest pain or pressure during coughing.',
              isEnglish: _isEnglish,
            ),
            SizedBox(height: 20),
            Text(
              _isEnglish
                  ? 'If you experience any of these symptoms, contact a doctor and seek proper treatment.'
                  : 'यदि आपको इन लक्षणों में से कोई भी अनुभव हो, तो डॉक्टर से संपर्क करें और सही उपचार की खोज करें।',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class SymptomTile extends StatelessWidget {
  final String title;
  final String descriptionHindi;
  final String descriptionEnglish;
  final bool isEnglish;

  const SymptomTile({
    Key? key,
    required this.title,
    required this.descriptionHindi,
    required this.descriptionEnglish,
    required this.isEnglish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          // Display Hindi description if the language is not English, otherwise display English description
          isEnglish ? descriptionEnglish : descriptionHindi,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}