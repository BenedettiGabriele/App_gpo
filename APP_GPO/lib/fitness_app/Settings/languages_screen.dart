import 'package:flutter/material.dart';
import 'package:best_flutter_ui_templates/fitness_app/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import '../fintness_app_theme.dart';

class LanguagesScreen extends StatefulWidget {
  @override
  _LanguagesScreenState createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  int languageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lingua'),
        backgroundColor: FitnessAppTheme.nearlyDarkBlue,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(tiles: [
            SettingsTile(
              title: "Italiano",
              trailing: trailingWidget(0),
              onTap: () {
                changeLanguage(0);
              },
            ),
            SettingsTile(
              title: "English",
              trailing: trailingWidget(1),
              onTap: () {
                changeLanguage(1);
              },
            ),
            SettingsTile(
              title: "Spanish",
              trailing: trailingWidget(2),
              onTap: () {
                changeLanguage(2);
              },
            ),
            SettingsTile(
              title: "German",
              trailing: trailingWidget(3),
              onTap: () {
                changeLanguage(3);
              },
            ),
          ]),
        ],
      ),
    );
  }

  Widget trailingWidget(int index) {
    return (languageIndex == index)
        ? Icon(Icons.check, color: FitnessAppTheme.nearlyDarkBlue)
        : Icon(null);
  }

  void changeLanguage(int index) {
    setState(() {
      body:
      Builder(builder: (BuildContext context) {
        return TextButton(
            child: Text('SEND'),
            onPressed: () {
              // here, Scaffold.of(context) returns the locally created Scaffold
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Message send successfully!')));
            });
      });
      languageIndex = index;
    });
  }
}
