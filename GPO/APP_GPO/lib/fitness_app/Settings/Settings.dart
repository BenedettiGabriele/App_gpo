import 'about_screen.dart';
import 'package:flutter/material.dart';
import 'package:best_flutter_ui_templates/fitness_app/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'languages_screen.dart';
import '../fintness_app_theme.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

_launchURL() async {
  const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  launchURL() {
    launch('https://flutter.dev');
  }

  bool lockInBackground = true;
  bool notificationsEnabled = true;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/fitness_app/impostazioni.png',
              color: Colors.white,
              width: 30,
              height: 30,
            ),
            Container(width: 10),
            Text('Impostazioni'),
          ],
        ),
        backgroundColor: Colors.indigo[500],
      ),
      body: SettingsList(
        // backgroundColor: Colors.orange,
        sections: [
          SettingsSection(
            title: 'Generale',
            // titleTextStyle: TextStyle(fontSize: 30),
            tiles: [
              SettingsTile(
                title: 'Lingua',
                titleTextStyle: TextStyle(
                  fontFamily: FitnessAppTheme.fontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  letterSpacing: 0.5,
                  color: FitnessAppTheme.lightText,
                ),
                subtitle: 'Italiano',
                subtitleTextStyle: TextStyle(
                  fontFamily: FitnessAppTheme.fontName,
                  //fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: FitnessAppTheme.darkerText,
                ),
                leading: Icon(Icons.language),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LanguagesScreen()));
                },
              ),
              SettingsTile(
                title: 'Altro...',
                titleTextStyle: TextStyle(
                  fontFamily: FitnessAppTheme.fontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  letterSpacing: 0.5,
                  color: FitnessAppTheme.lightText,
                ),
                subtitle: 'What pill is it?',
                subtitleTextStyle: TextStyle(
                  fontFamily: FitnessAppTheme.fontName,
                  //fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: FitnessAppTheme.darkerText,
                ),
                leading: Icon(Icons.cloud_queue),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AboutScreen()));
                },
              ),
            ],
          ),
          /* SettingsSection(
            title: 'Account',
            tiles: [
              SettingsTile(title: 'Phone number', leading: Icon(Icons.phone)),
              SettingsTile(title: 'Email', leading: Icon(Icons.email)),
              SettingsTile(title: 'Sign out', leading: Icon(Icons.exit_to_app)),
            ],
          ),*/
          SettingsSection(
            title: 'Sicurezza',
            tiles: [
              SettingsTile.switchTile(
                title: 'Blocco app in background',
                titleTextStyle: TextStyle(
                  fontFamily: FitnessAppTheme.fontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  letterSpacing: 0.5,
                  color: FitnessAppTheme.lightText,
                ),
                leading: Icon(Icons.phonelink_lock),
                switchValue: lockInBackground,
                enabled: true,
                switchActiveColor: Colors.indigo[500],
                onToggle: (bool value) {
                  setState(() {
                    lockInBackground = value;
                    //notificationsEnabled = value;
                  });
                },
              ),
              SettingsTile.switchTile(
                  title: 'Impronta digitale',
                  titleTextStyle: TextStyle(
                    fontFamily: FitnessAppTheme.fontName,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    letterSpacing: 0.5,
                    color: FitnessAppTheme.lightText,
                  ),
                  leading: Icon(Icons.fingerprint),
                  switchActiveColor: Colors.indigo[500],
                  onToggle: (bool value) {},
                  switchValue: false),
              /*SettingsTile.switchTile(
                title: 'Change password',
                leading: Icon(Icons.lock),
                switchValue: true,
                onToggle: (bool value) {},
              ),*/
              SettingsTile.switchTile(
                title: 'Abilita notifiche',
                titleTextStyle: TextStyle(
                  fontFamily: FitnessAppTheme.fontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  letterSpacing: 0.5,
                  color: FitnessAppTheme.lightText,
                ),
                //enabled: notificationsEnabled,
                leading: Icon(Icons.notifications_active),
                switchValue: notificationsEnabled,
                switchActiveColor: Colors.indigo[500],
                onToggle: (bool value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                },
              ),
              SettingsTile.switchTile(
                title: 'Dark mode',
                titleTextStyle: TextStyle(
                  fontFamily: FitnessAppTheme.fontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  letterSpacing: 0.5,
                  color: FitnessAppTheme.lightText,
                ),
                leading: Icon(Icons.phonelink_lock),
                switchValue: false,
                switchActiveColor: Colors.indigo[500],
                onToggle: (bool value) {
                  /*setState(() {
                    darkMode = value;
                  });*/
                },
              ),
            ],
          ),
          /*   SettingsSection(
            title: 'Misc',
            tiles: [
              SettingsTile(
                  title: 'Terms of Service', leading: Icon(Icons.description)),
              SettingsTile(
                  title: 'Open source licenses',
                  leading: Icon(Icons.collections_bookmark)),
            ],
          ),*/
          /*CustomSection(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 8),
                  child: Image.asset(
                    'assets/fitness_app/settings.png',
                    height: 100,
                    width: 100,
                    color: Colors.indigo[500],
                  ),
                ),
                Text(
                  'Versione: 1.0',
                  style: TextStyle(
                    fontFamily: FitnessAppTheme.fontName,
                    //fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.indigo[500],
                  ),
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}
