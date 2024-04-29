import 'package:flutter/material.dart';
class AsthmaSymptomsPage extends StatefulWidget {
  const AsthmaSymptomsPage({super.key});

  @override
  _AsthmaSymptomsPageState createState() => _AsthmaSymptomsPageState();
}

class _AsthmaSymptomsPageState extends State<AsthmaSymptomsPage> {
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
      {'hi': 'आस्थमा के लक्षण', 'en': 'Asthma Symptoms'},
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
              title: '1. साँस लेने में कठिनाई - Difficulty breathing:',
              descriptionHindi:
              'यह एक प्रमुख लक्षण है। आस्थमा के रोगी अक्सर साँस लेने में परेशानी महसूस करते हैं।',
              descriptionEnglish:
              'This is a major symptom. Asthma patients often feel difficulty in breathing.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '2. छाती में दर्द और तनाव - Chest pain and tightness:',
              descriptionHindi:
              'यह एक और आम लक्षण है, जो आस्थमा के रोगी को अनुभव कर सकते हैं।',
              descriptionEnglish:
              'Another common symptom that asthma patients may experience.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '3. खांसी और घातक - Coughing and wheezing:',
              descriptionHindi:
              'आस्थमा के रोगी अक्सर खांसी की समस्या का सामना करते हैं, जिसमें खांसी का ताना बहुत ही तीव्र हो सकता है।',
              descriptionEnglish:
              'Asthma patients often face a coughing problem, which can be severe.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '4. साँस की लार में बदलाव - Changes in breathing pattern:',
              descriptionHindi:
              'यह भी आस्थमा का एक लक्षण है, जिसमें साँस की लार में बदलाव हो सकता है, जैसे कि इसमें बढ़ा हुआ या कम हुआ होना।',
              descriptionEnglish:
              'This is also a symptom of asthma, where there can be changes in the pattern of breathing, such as increased or decreased breaths.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '5. रात को साँस की समस्याएं - Nighttime breathing issues:',
              descriptionHindi:
              'बहुत से आस्थमा के रोगी रात को साँस लेने में परेशानी महसूस करते हैं, जो उन्हें नींद के दौरान भी उत्पन्न कर सकती है।',
              descriptionEnglish:
              'Many asthma patients feel difficulty in breathing at night, which can disturb their sleep.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '6. साँस की श्वास लेने में तेजी से बदलाव - Rapid changes in breathing:',
              descriptionHindi:
              'इसमें साँस लेने की तरीके में तेजी से बदलाव होता है, जैसे कि गहरी साँस लेना या फिर श्वास की संख्या की वृद्धि होना।',
              descriptionEnglish:
              'This involves rapid changes in the way of breathing, such as taking deep breaths or an increase in the number of breaths.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '7. अधिक शारीरिक थकान - Increased physical fatigue:',
              descriptionHindi:
              'यह भी एक सामान्य लक्षण है, जिसमें आस्थमा के रोगी शारीरिक थकान महसूस कर सकते हैं और अधिक थका हुआ महसूस कर सकते हैं।',
              descriptionEnglish:
              'This is also a common symptom, where asthma patients may feel physical fatigue and become more tired.',
              isEnglish: _isEnglish,
            ),
            SizedBox(height: 20),
            Text(
              _isEnglish
                  ? 'If you experience any of these symptoms, contact a doctor and seek proper treatment. Note that asthma can be a serious condition, so timely treatment is essential.'
                  : 'यदि आपको ऐसे किसी भी लक्षण का सामना होता है, तो डॉक्टर से संपर्क करें और उचित इलाज करवाएं। ध्यान दें कि आस्थमा गंभीर समस्या हो सकती है, इसलिए सही समय पर उपचार कराना जरूरी होता है।',
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