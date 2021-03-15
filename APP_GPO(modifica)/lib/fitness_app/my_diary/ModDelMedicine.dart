import 'package:best_flutter_ui_templates/fitness_app/dbManager.dart';
import 'package:flutter/material.dart';
import '../fintness_app_theme.dart';
import '../medicine.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/new_medicine.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/weekday_selector.dart';
import 'package:intl/intl.dart';

class ModDelMedicine extends StatefulWidget {
  final enteredName = TextEditingController();

  final enteredPills = TextEditingController();

  final enteredHour = TextEditingController();

  final enteredDays = TextEditingController();

  static var id;
  var values = List<bool>(7);

  ModDelMedicine(name, pills, hour, days) {
    this.enteredName.text = name;
    this.enteredPills.text = pills.toString();
    this.enteredHour.text = hour;
    this.enteredDays.text = days;

    getId(name, pills, hour, days);

    for (int i = 0; i < 7; i++) {
      if (days[i] == "S") values[i] = true;
      if (days[i] == "N") values[i] = false;
    }
  }

  @override
  _ModDelMedicineState createState() => _ModDelMedicineState();
}

void getId(name, pills, hour, days) async {
  DbManager db = new DbManager();
  ModDelMedicine.id = await db.getId(Medicine(name, pills, hour, days));
}

class _ModDelMedicineState extends State<ModDelMedicine> {
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
                    controller: widget.enteredName,
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
                    "Pillole caricate: ",
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
                    keyboardType: TextInputType.number,
                    cursorColor: FitnessAppTheme.nearlyDarkBlue,
                    controller: widget.enteredPills,
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
                  child:
                      /*TextField(
                    cursorColor: FitnessAppTheme.nearlyDarkBlue,
                    controller: widget.enteredHour,
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
                  ),*/
                      FlatButton(
                    onPressed: () async {
                      var selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (selectedTime != null) {
                        final now = DateTime.now();
                        var selectedDateTime = DateTime(now.year, now.month,
                            now.day, selectedTime.hour, selectedTime.minute);
                        DateTime _alarmTime = selectedDateTime;
                        setState(() {
                          String _alarmTimeString =
                              DateFormat('HH:mm').format(selectedDateTime);
                        });
                      } else {
                        var now = new DateTime.now();
                        var formatter = new DateFormat('HH:mm');
                        String _alarmTimeString = formatter.format(now);
                      }
                    },
                    child: Text(
                      widget.enteredHour.text,
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 30,
            ),
            //Selezione dei giorni: MANCA PRESELEZIONE DEI GIORNI IN BASE AL PROMEMORIA
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Ripeti:",
                    style: TextStyle(
                      fontFamily: FitnessAppTheme.fontName,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      letterSpacing: 0.5,
                      color: FitnessAppTheme.lightText,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: (MediaQuery.of(context).size.width) * (9 / 10),
                  margin: EdgeInsets.only(left: 15.0),
                  child: WeekdaySelector(
                    selectedFillColor: FitnessAppTheme.nearlyDarkBlue,
                    onChanged: (v) {
                      printIntAsDay(v);
                      setState(() {
                        widget.values[v % 7] = !widget.values[v % 7];
                      });
                    },
                    values: widget.values,
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
                      modificaMed(
                          ModDelMedicine.id,
                          widget.enteredName.text,
                          int.parse(widget.enteredPills.text),
                          widget.enteredHour.text,
                          widget.enteredDays.text);
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
                      eliminaMed(
                          widget.enteredName.text,
                          int.parse(widget.enteredPills.text),
                          widget.enteredHour.text,
                          widget.enteredDays.text);

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

void eliminaMed(text, numPills, hour, selDays) {
  DbManager db = new DbManager();
  db.deleteMedicine(new Medicine(text, numPills, hour, selDays));
}

void modificaMed(id, text, numPills, hour, selDays) {
  DbManager db = new DbManager();
  db.modMedicine(id, new Medicine(text, numPills, hour, selDays));
}
