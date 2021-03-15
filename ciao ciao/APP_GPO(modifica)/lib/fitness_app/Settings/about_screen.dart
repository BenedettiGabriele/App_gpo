import 'package:flutter/material.dart';
import 'package:best_flutter_ui_templates/fitness_app/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:core';
import '../fintness_app_theme.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

_launchURL() async {
  const url =
      'https://www.impresainazione.it/pagina_vetrina/what-pill-is-it-2/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

final Uri _emailLaunchUri = Uri(
  scheme: 'mailto',
  path: 'progetto.gpolonghi@gmail.com',
);

final Uri _telLaunchUri = Uri(
  scheme: 'tel',
  path: '+39 383 724 6872',
);

final Uri _smsLaunchUri = Uri(
  scheme: 'sms',
  path: '+39 383 724 6872',
);

final Uri _siteLaunchUri = Uri(
  scheme: 'http',
  path: 'https://www.impresainazione.it/pagina_vetrina/what-pill-is-it-2/',
);

class _AboutScreenState extends State<AboutScreen> {
  launchURL() {
    launch('https://flutter.dev');
  }

  int aboutIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Altro...'),
        backgroundColor: FitnessAppTheme.nearlyDarkBlue,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(tiles: [
            SettingsTile(
              title: "Società: ",
              subtitle: "What pill is it?",
              onTap: () {
                launch(_siteLaunchUri.toString());
              },
            ),
            SettingsTile(
              title: "Contattaci:",
              subtitle: "progetto.gpolonghi@gmail.com",
              onTap: () {
                launch(_emailLaunchUri.toString());
              },
            ),
            SettingsTile(
              title: "Contattaci:",
              subtitle: "+39 383 724 6872",
              onTap: () {
                launch(_telLaunchUri.toString());
              },
            ),
            /*SettingsTile(
              title: "Message us:",
              subtitle: "+39 383 724 6872",
              onTap: () {
                launch(_smsLaunchUri.toString());
              },
            ),*/
            SettingsTile(
              title: "Versione: ",
              subtitle: "1.0",
            ),
          ]),
        ],
      ),
    );
  }
}
