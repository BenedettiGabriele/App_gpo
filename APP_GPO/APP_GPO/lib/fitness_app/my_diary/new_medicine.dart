//import 'package:best_flutter_ui_templates/fitness_app/my_diary/my_diary_screen.dart';
import 'package:best_flutter_ui_templates/fitness_app/dbManager.dart';
import 'package:best_flutter_ui_templates/fitness_app/medicine.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/my_diary_screen.dart';
import 'package:flutter/material.dart';

import '../fintness_app_theme.dart';

class AddMedicine extends StatelessWidget {
  final newHour = TextEditingController();
  final newNPills = TextEditingController();
  final newMedicine = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aggiungi un nuovo promemoria"),
        backgroundColor: FitnessAppTheme.nearlyDarkBlue,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Nome medicina: ",
                    style: TextStyle(
                      fontFamily: FitnessAppTheme.fontName,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      letterSpacing: 0.5,
                      color: FitnessAppTheme.lightText,
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  height: 50,
                  width: 150,
                  child: TextField(
                    cursorColor: FitnessAppTheme.nearlyDarkBlue,
                    controller: newMedicine,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FitnessAppTheme.nearlyDarkBlue,
                          width: 2,
                        ),
                      ),
                      labelText: 'Nome',
                      labelStyle: TextStyle(color: FitnessAppTheme.lightText),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Numero pillole: ",
                    style: TextStyle(
                      fontFamily: FitnessAppTheme.fontName,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      letterSpacing: 0.5,
                      color: FitnessAppTheme.lightText,
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  height: 50,
                  width: 150,
                  child: TextField(
                    cursorColor: FitnessAppTheme.nearlyDarkBlue,
                    controller: newNPills,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FitnessAppTheme.nearlyDarkBlue,
                          width: 2,
                        ),
                      ),
                      labelText: 'Numero',
                      labelStyle: TextStyle(color: FitnessAppTheme.lightText),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Orario: ",
                    style: TextStyle(
                      fontFamily: FitnessAppTheme.fontName,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      letterSpacing: 0.5,
                      color: FitnessAppTheme.lightText,
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  height: 50,
                  width: 150,
                  child: TextField(
                    cursorColor: FitnessAppTheme.nearlyDarkBlue,
                    controller: newHour,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: FitnessAppTheme.lightText)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FitnessAppTheme.nearlyDarkBlue,
                          width: 2,
                        ),
                      ),
                      labelText: 'Ora',
                      labelStyle: TextStyle(color: FitnessAppTheme.lightText),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 30,
            ),
            Row(
              children: [
                Container(width: 20),
                Expanded(
                  child: FlatButton(
                    color: FitnessAppTheme.nearlyDarkBlue,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(12.0),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0)),
                    onPressed: () {
                      Medicine medicine = new Medicine(newMedicine.text,
                          int.parse(newNPills.text), newHour.text);
                      DbManager db = new DbManager();
                      db.insertMedicine(medicine);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Aggiungi promemoria",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                Container(width: 20),
              ],
            )
          ],
        ),
      ),
    );
  }
}
