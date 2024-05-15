import 'package:flutter/material.dart';
class ViralFeverPage extends StatefulWidget {
  const  ViralFeverPage({super.key});

  @override
  _ViralFeverPageState createState() => _ViralFeverPageState();
}

class _ViralFeverPageState extends State<ViralFeverPage> {
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
      {'hi': 'वायरल बुखार के लक्षण', 'en': 'Viral Fever Symptoms'},
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
              title: '1. बुखार - Fever:',
              descriptionHindi:
              'वायरल बुखार के लक्षण में पहला और सबसे महत्वपूर्ण लक्षण बुखार है।',
              descriptionEnglish:
              'Fever is the first and most important symptom of viral fever.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '2. थकान - Fatigue:',
              descriptionHindi: 'वायरल बुखार में थकान भी होती है।',
              descriptionEnglish: 'Fatigue is also present in viral fever.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '3. सिरदर्द - Headache:',
              descriptionHindi:
              'वायरल बुखार के लक्षणों में सिरदर्द भी हो सकता है।',
              descriptionEnglish:
              'Headache can also be a symptom of viral fever.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '4. गले में दर्द - Sore throat:',
              descriptionHindi:
              'गले में दर्द और खराश वायरल बुखार के लक्षणों में से एक हो सकता है।',
              descriptionEnglish:
              'Sore throat and irritation can be symptoms of viral fever.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '5. नाक से पानी गिरना - Runny nose:',
              descriptionHindi:
              'वायरल बुखार के लक्षणों में नाक से पानी गिरना भी हो सकता है।',
              descriptionEnglish:
              'Runny nose can also be a symptom of viral fever.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '6. गले में खराश - Cough:',
              descriptionHindi:
              'वायरल बुखार के लक्षणों में खांसी और गले में खराश हो सकती है।',
              descriptionEnglish:
              'Cough and throat irritation can be symptoms of viral fever.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '7. पेट में दर्द - Stomach ache:',
              descriptionHindi:
              'वायरल बुखार के लक्षणों में पेट में दर्द भी हो सकता है।',
              descriptionEnglish:
              'Stomach ache can also be a symptom of viral fever.',
              isEnglish: _isEnglish,
            ),
            SizedBox(height: 20),
            Text(
              _isEnglish
                  ? 'If you experience any of these symptoms, contact a doctor and seek proper treatment.timely treatment is essential.'
                  : 'यदि आपको ऐसे किसी भी लक्षण का सामना होता है, तो डॉक्टर से संपर्क करें और सही समय पर उपचार कराना जरूरी है।',
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