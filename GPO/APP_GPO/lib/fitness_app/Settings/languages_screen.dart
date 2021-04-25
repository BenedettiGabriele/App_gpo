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
        backgroundColor: Colors.indigo,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(tiles: [
            SettingsTile(
              title: "Italiano",
              titleTextStyle: TextStyle(
                fontFamily: FitnessAppTheme.fontName,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: FitnessAppTheme.darkerText,
              ),
              trailing: trailingWidget(0),
              onTap: () {
                changeLanguage(0);
              },
            ),
            SettingsTile(
              title: "English",
              titleTextStyle: TextStyle(
                fontFamily: FitnessAppTheme.fontName,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: FitnessAppTheme.darkerText,
              ),
              trailing: trailingWidget(1),
              onTap: () {
                changeLanguage(1);
              },
            ),
            SettingsTile(
              title: "Spanish",
              titleTextStyle: TextStyle(
                fontFamily: FitnessAppTheme.fontName,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: FitnessAppTheme.darkerText,
              ),
              trailing: trailingWidget(2),
              onTap: () {
                changeLanguage(2);
              },
            ),
            SettingsTile(
              title: "German",
              titleTextStyle: TextStyle(
                fontFamily: FitnessAppTheme.fontName,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: FitnessAppTheme.darkerText,
              ),
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
