import 'package:best_flutter_ui_templates/fitness_app/dbManager.dart';
import 'package:flutter/material.dart';
import '../fintness_app_theme.dart';
import '../medicine.dart';

class ModDelMedicine extends StatelessWidget {
  final enteredName = TextEditingController();
  final enteredPills = TextEditingController();
  final enteredHour = TextEditingController();

  ModDelMedicine(name, pills, hour) {
    this.enteredName.text = name;
    this.enteredPills.text = pills.toString();
    this.enteredHour.text = hour;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modifica il promemoria"),
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
                    controller: enteredName,
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
                    controller: enteredPills,
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
                    controller: enteredHour,
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
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Modifica promemoria",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                Container(width: 20),
              ],
            ),
            Container(
              height: 10,
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
                      DbManager db = new DbManager();
                      db.deleteMedicine(new Medicine(enteredName.text,
                          int.parse(enteredPills.text), enteredHour.text));
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Elimina promemoria",
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
