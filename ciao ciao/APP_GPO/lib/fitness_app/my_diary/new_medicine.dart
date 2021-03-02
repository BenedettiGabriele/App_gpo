//import 'package:best_flutter_ui_templates/fitness_app/my_diary/my_diary_screen.dart';
import 'package:best_flutter_ui_templates/fitness_app/dbManager.dart';
import 'package:best_flutter_ui_templates/fitness_app/medicine.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/weekday_selector.dart';
import 'package:best_flutter_ui_templates/alarm_helper.dart';
import 'package:best_flutter_ui_templates/alarm_info.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../fintness_app_theme.dart';

class AddMedicine extends StatefulWidget {
  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final newHour = TextEditingController();

  final newNPills = TextEditingController();

  final newMedicine = TextEditingController();

  final values = <bool>[false, false, false, false, false, false, false];

  AlarmHelper _alarmHelper = AlarmHelper();

  DateTime _alarmTime;

  String _alarmTimeString = "00:00";

  Future<List<AlarmInfo>> _alarms;

  /*@override
  void initState() {
    _alarmTime = DateTime.now();
    _alarmHelper.initializeDatabase().then((value) {
      print('------database intialized');
      loadAlarms();
    });
    super.initState();
  }

  void loadAlarms() {
    _alarms = _alarmHelper.getAlarms(); //get dal database
    if (mounted) setState(() {});
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //per evitare bottom overflow
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
                  child:
                      /*TextField(
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
                        _alarmTime = selectedDateTime;
                        setState(() {
                          _alarmTimeString =
                              DateFormat('HH:mm').format(selectedDateTime);
                        });
                      } else {
                        var now = new DateTime.now();
                        var formatter = new DateFormat('HH:mm');
                        String _alarmTimeString = formatter.format(now);
                      }
                    },
                    child: Text(
                      _alarmTimeString,
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 30,
            ),
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
                  margin: EdgeInsets.only(left: 15.0),
                  width: (MediaQuery.of(context).size.width) * (9 / 10),
                  height: 50,
                  child: WeekdaySelector(
                    selectedFillColor: FitnessAppTheme.nearlyDarkBlue,
                    onChanged: (v) {
                      printIntAsDay(v);
                      setState(() {
                        values[v % 7] = !values[v % 7];
                      });
                    },
                    values: values,
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
                      String days = "";
                      for (int i = 0; i < 7; i++) {
                        if (values[i] == true) days += "S";
                        if (values[i] == false) days += "N";
                      }

                      //Salvo la medicina nella tabella con i promemoria
                      Medicine medicine = new Medicine(newMedicine.text,
                          int.parse(newNPills.text), _alarmTimeString, days);
                      DbManager db = new DbManager();
                      db.insertMedicine(medicine);
                      Navigator.pop(context);

                      //Imposto la notifica
                      onSaveAlarm(newMedicine.text);
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

  void onSaveAlarm(nomeMedicina) {
    DateTime scheduleAlarmDateTime;

    //Se è nel futuro ok, se è nel passato la mette domani
    if (_alarmTime.isAfter(DateTime.now()))
      scheduleAlarmDateTime = _alarmTime;
    else
      scheduleAlarmDateTime = _alarmTime.add(Duration(days: 1));

    //info sulla svegla inserite dall'utente
    var alarmInfo = AlarmInfo(
      alarmDateTime: scheduleAlarmDateTime,
      //gradientColorIndex: _currentAlarms.length,
      title: nomeMedicina, //descrizione presente nella notifica
    );

    //Stampo nella console i giorni selezionati
    print(values);

    //Imposto la notifica. Parto da oggi: oggi deve suonare? NO, ok, vado avanti finchè trovo il prossimo momento in cui deve suonare. Quando lo trovo imposto la notifica...
    var today = DateTime.now();

    for (int i = 0; i < 7; i++) {
      //FORSE i<6 MA NON SONO SICUROO
      if (values[today.weekday + i] == true) {
        //Se il giorno corrente + offset è selezionato, se non è ancora passato imposto la notifica
        print(today.weekday.toString());
        if (DateTime.now().isBefore(alarmInfo.alarmDateTime)) {
          scheduleAlarmDateTime = DateTime(
              alarmInfo.alarmDateTime.year,
              alarmInfo.alarmDateTime.month,
              alarmInfo.alarmDateTime.day,
              _alarmTime.hour,
              _alarmTime.minute);

          _alarmHelper.insertAlarm(alarmInfo); //salvo nel DB
          scheduleAlarm(scheduleAlarmDateTime, alarmInfo);
          //Navigator.pop(context);
          //loadAlarms();
        }
      }
    }
  }

  int dayToInt(DateTime day) {
    print(day.toString());
    if (day.weekday.toString() == "Monday") return 1;
    if (day.weekday.toString() == "Tuesday") return 2;
    if (day.weekday.toString() == "Wednesday") return 3;
    if (day.weekday.toString() == "Thursday") return 4;
    if (day.weekday.toString() == "Friday") return 5;
    if (day.weekday.toString() == "Saturday") return 6;
    if (day.weekday.toString() == "Sunday") return 7;

    return -1;
  }

  void scheduleAlarm(
      DateTime scheduledNotificationDateTime, AlarmInfo alarmInfo) async {
    //Per android:
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: 'codex_logo',
      sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap('codex_logo'),
    );

    //Per iOS:
    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        sound: 'a_long_cold_sting.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);

    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    //Impostazione della notifica
    await flutterLocalNotificationsPlugin.schedule(
        0,
        alarmInfo.title, //titolo
        "E' ora di prendere la tua medicina!", //corpo del messaggio
        scheduledNotificationDateTime,
        platformChannelSpecifics);

    print("NOTIFICA IMPOSTATA");
  }
}

printIntAsDay(int day) {
  print('Received integer: $day. Corresponds to day: ${intDayToEnglish(day)}');
}

String intDayToEnglish(int day) {
  if (day % 7 == DateTime.monday % 7) return 'Monday';
  if (day % 7 == DateTime.tuesday % 7) return 'Tuesday';
  if (day % 7 == DateTime.wednesday % 7) return 'Wednesday';
  if (day % 7 == DateTime.thursday % 7) return 'Thursday';
  if (day % 7 == DateTime.friday % 7) return 'Friday';
  if (day % 7 == DateTime.saturday % 7) return 'Saturday';
  if (day % 7 == DateTime.sunday % 7) return 'Sunday';
  throw '🐞 This should never have happened: $day';
}
