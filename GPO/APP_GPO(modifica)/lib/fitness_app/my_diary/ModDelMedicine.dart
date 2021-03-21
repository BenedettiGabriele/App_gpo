import 'package:best_flutter_ui_templates/fitness_app/dbManager.dart';
import 'package:flutter/material.dart';
import '../fintness_app_theme.dart';
import '../medicine.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/new_medicine.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/weekday_selector.dart';
import 'package:best_flutter_ui_templates/alarm_info.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  DateTime _alarmTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FitnessAppTheme.background,
      resizeToAvoidBottomInset: false, //per evitare bottom overflow
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
                      var oraminuti = (widget.enteredHour.text.split(":"));
                      int ora = int.parse(oraminuti[0]);
                      int minuti = int.parse(oraminuti[1]);
                      widget.enteredHour.text =
                          TimeOfDay(hour: ora, minute: minuti).toString();

                      var selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(hour: ora, minute: minuti),
                      );

                      if (selectedTime != null) {
                        final now = DateTime.now();
                        var selectedDateTime = DateTime(now.year, now.month,
                            now.day, selectedTime.hour, selectedTime.minute);
                        _alarmTime = selectedDateTime;
                        setState(() {
                          widget.enteredHour.text =
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
                      String days = "";
                      for (int i = 0; i < 7; i++) {
                        if (widget.values[i] == true) days += "S";
                        if (widget.values[i] == false) days += "N";
                      }

                      modificaMed(
                          ModDelMedicine.id,
                          widget.enteredName.text,
                          int.parse(widget.enteredPills.text),
                          widget.enteredHour.text,
                          days);

                      eliminaNotificaMed(Medicine(
                          widget.enteredName.text,
                          int.parse(widget.enteredPills.text),
                          widget.enteredHour.text,
                          days));

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

  void eliminaNotificaMed(medicina) async {
    var id = ModDelMedicine.id;
    //Elimino tutte le notifiche con id = 1000+id, 2000+id, ..., 7000+id.
    await flutterLocalNotificationsPlugin.cancel(id + 1000);
    print("eliminata notifica con id = " + (id + 1000).toString());
    await flutterLocalNotificationsPlugin.cancel(id + 2000);
    print("eliminata notifica con id = " + (id + 2000).toString());
    await flutterLocalNotificationsPlugin.cancel(id + 3000);
    print("eliminata notifica con id = " + (id + 3000).toString());
    await flutterLocalNotificationsPlugin.cancel(id + 4000);
    print("eliminata notifica con id = " + (id + 4000).toString());
    await flutterLocalNotificationsPlugin.cancel(id + 5000);
    print("eliminata notifica con id = " + (id + 5000).toString());
    await flutterLocalNotificationsPlugin.cancel(id + 6000);
    print("eliminata notifica con id = " + (id + 6000).toString());
    await flutterLocalNotificationsPlugin.cancel(id + 7000);
    print("eliminata notifica con id = " + (id + 7000).toString());

    inserisciNotificaMed(medicina);
  }

  void inserisciNotificaMed(medicine) async {
    //Imposto la notifica
    onSaveAlarm(widget.enteredName.text);
  }

  void onSaveAlarm(nomeMedicina) {
    var oraminuti = (widget.enteredHour.text.split(":"));
    int ora = int.parse(oraminuti[0]);
    int minuti = int.parse(oraminuti[1]);
    DateTime now = DateTime.now();
    DateTime scheduleAlarmDateTime =
        DateTime(now.year, now.month, now.day, ora, minuti);

    //info sulla svegla inserite dall'utente
    var alarmInfo = AlarmInfo(
      alarmDateTime: scheduleAlarmDateTime,
      //gradientColorIndex: _currentAlarms.length,
      title: nomeMedicina, //descrizione presente nella notifica
    );

    //Stampo nella console i giorni selezionati
    print(widget.values);

    //Imposto la notifica. Parto da oggi: oggi deve suonare? NO, ok, vado avanti finchè trovo il prossimo momento in cui deve suonare. Quando lo trovo imposto la notifica...
    var today = DateTime.now();
    var idMed_local = ModDelMedicine.id;
    //Imposto la notifica per ogni giorno tra quelli selezionati e gli do' lo stesso id della medicina.
    for (var i = 0; i < 7; i++) {
      idMed_local += 1000;
      print("id notifica: " + idMed_local.toString());
      if (widget.values[i] == true) {
        scheduleAlarmDateTime = DateTime(
            alarmInfo.alarmDateTime.year,
            alarmInfo.alarmDateTime.month,
            alarmInfo.alarmDateTime.day,
            alarmInfo.alarmDateTime.hour,
            alarmInfo.alarmDateTime.minute);

        //var idMed = 0; //prova
        scheduleAlarm(scheduleAlarmDateTime, alarmInfo, i, idMed_local);
      }
    }
  }

  void scheduleAlarm(DateTime scheduleAlarmDateTime, AlarmInfo alarmInfo, i,
      idMed_local) async {
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

    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    //Impostazione della notifica
    var giorno = giornoSett(i);
    var ora = Time(scheduleAlarmDateTime.hour, scheduleAlarmDateTime.minute,
        scheduleAlarmDateTime.second);
    print("sto per impostare la notifica con i seguenti dati: " +
        giorno.value.toString() +
        "," +
        ora.hour.toString() +
        "," +
        ora.minute.toString() +
        "," +
        ora.second.toString() +
        ".");
    await flutterLocalNotificationsPlugin
        .showWeeklyAtDayAndTime(
            idMed_local,
            alarmInfo.title,
            "E' ora di prendere la tua medicina!",
            giorno,
            ora,
            platformChannelSpecifics)
        .then((value) {
      print("NOTIFICA IMPOSTATA");
    });

    /*await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'weekly scheduled notification title',
        'weekly scheduled notification body',
        _nextWeekdayAlarm(),
        const NotificationDetails(
          android: AndroidNotificationDetails(
              'weekly notification channel id',
              'weekly notification channel name',
              'weekly notificationdescription'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);*/
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
