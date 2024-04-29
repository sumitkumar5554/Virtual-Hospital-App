import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrivacyPage(),
    );
  }
}

class PrivacyPage extends StatefulWidget {
  @override
  _PrivacyPageState createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  bool _isPrivacyEnabled = false;
  bool _isIncognitoModeEnabled = false;
  bool _hideLastSeen = false;
  bool _hideOnlineStatus = false;
  bool _disableReadReceipts = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildPrivacyModeTile(),
            SizedBox(height: 20.0),
            buildIncognitoModeTile(),
            SizedBox(height: 20.0),
            buildPrivacyFeatureTile(
              title: 'Hide Last Seen',
              value: _hideLastSeen,
              onChanged: (value) {
                setState(() {
                  _hideLastSeen = value!;
                });
              },
            ),
            SizedBox(height: 20.0),
            buildPrivacyFeatureTile(
              title: 'Hide Online Status',
              value: _hideOnlineStatus,
              onChanged: (value) {
                setState(() {
                  _hideOnlineStatus = value!;
                });
              },
            ),
            SizedBox(height: 20.0),
            buildPrivacyFeatureTile(
              title: 'Disable Read Receipts',
              value: _disableReadReceipts,
              onChanged: (value) {
                setState(() {
                  _disableReadReceipts = value!;
                });
              },
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                // Save privacy settings to local storage or send to server
                print('Privacy mode enabled: $_isPrivacyEnabled');
                print('Incognito mode enabled: $_isIncognitoModeEnabled');
                print('Hide Last Seen: $_hideLastSeen');
                print('Hide Online Status: $_hideOnlineStatus');
                print('Disable Read Receipts: $_disableReadReceipts');
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPrivacyModeTile() {
    return ListTile(
      title: Text('Privacy Mode'),
      subtitle: Text('Enable to protect your privacy'),
      trailing: Switch(
        value: _isPrivacyEnabled,
        onChanged: (value) {
          setState(() {
            _isPrivacyEnabled = value;
          });
        },
      ),
    );
  }

  Widget buildIncognitoModeTile() {
    return ListTile(
      title: Text('Incognito Mode'),
      subtitle: Text('Browse privately'),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 17.0), // Adjust the right padding as needed
        child: Icon(
          _isIncognitoModeEnabled ? Icons.visibility_off : Icons.visibility,
          color: _isIncognitoModeEnabled ? Colors.red : Colors.green,
        ),
      ),
      onTap: () {
        setState(() {
          _isIncognitoModeEnabled = !_isIncognitoModeEnabled;
        });
      },
    );
  }

  Widget buildPrivacyFeatureTile({
    required String title,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return ListTile(
      title: Text(title),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
