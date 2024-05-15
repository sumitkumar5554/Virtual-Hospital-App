import 'package:flutter/material.dart';
class CancerSymptomsPage extends StatefulWidget {
  const CancerSymptomsPage({super.key});

  @override
  _CancerSymptomsPageState createState() => _CancerSymptomsPageState();
}

class _CancerSymptomsPageState extends State<CancerSymptomsPage> {
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
      {'hi': 'कैंसर के लक्षण', 'en': 'Cancer Symptoms'},
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
              title: '1. तेजी से वजन कम होना - Rapid Weight Loss:',
              descriptionHindi:
              'कैंसर के रोगियों में अकसर तेजी से वजन कम होने का लक्षण देखा जाता है।',
              descriptionEnglish:
              'Rapid weight loss is often observed in cancer patients.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '2. लक्षण की अनुसार स्थानांतरण - Migration of Symptoms:',
              descriptionHindi:
              'कुछ कैंसरों में, लक्षण एक स्थान से दूसरे स्थान पर स्थानांतरित हो सकते हैं।',
              descriptionEnglish:
              'In some cancers, symptoms can migrate from one location to another.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '3. अनियमित बारिश - Irregular Bleeding:',
              descriptionHindi:
              'कुछ कैंसरों में, अनियमित और असामान्य रक्तस्राव हो सकता है।',
              descriptionEnglish:
              'In some cancers, irregular and unusual bleeding can occur.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '4. गायन अनियमितता - Urinary Irregularities:',
              descriptionHindi:
              'कैंसर के रोगियों में मूत्र में अनियमितता या असामान्य रूप से बदलाव देखा जा सकता है।',
              descriptionEnglish:
              'Cancer patients may experience irregularities or unusual changes in urine.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '5. चक्कर आना - Dizziness:',
              descriptionHindi:
              'कुछ कैंसर के रोगी चक्कर आने की समस्या का सामना कर सकते हैं।',
              descriptionEnglish:
              'Some cancer patients may experience dizziness.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '6. खांसी और साँस की समस्याएं - Cough and Breathing Problems:',
              descriptionHindi:
              'कुछ कैंसर के प्रकारों में, खांसी और साँस की समस्याएं भी हो सकती हैं।',
              descriptionEnglish:
              'In some types of cancer, cough and breathing problems can also occur.',
              isEnglish: _isEnglish,
            ),
            SymptomTile(
              title: '7. चक्कराना या बेहोशी - Fainting or Loss of Consciousness:',
              descriptionHindi:
              'कुछ कैंसर के रोगियों में, चक्कराना या बेहोशी की समस्या भी हो सकती है।',
              descriptionEnglish:
              'Some cancer patients may experience fainting or loss of consciousness.',
              isEnglish: _isEnglish,
            ),
            SizedBox(height: 20),
            Text(
              _isEnglish
                  ? 'If you experience any of these symptoms, contact a doctor and seek proper treatment. Note that Cancer can be a serious condition, so timely treatment is essential.'
                  : 'यदि आपको ऐसे किसी भी लक्षण का सामना होता है, तो डॉक्टर से संपर्क करें और उचित इलाज करवाएं। ध्यान दें कि कैंसर गंभीर समस्या हो सकती है, इसलिए सही समय पर उपचार कराना जरूरी होता है।',
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