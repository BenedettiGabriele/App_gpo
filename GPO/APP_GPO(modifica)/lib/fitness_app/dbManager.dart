import 'package:best_flutter_ui_templates/main.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:best_flutter_ui_templates/fitness_app/medicine.dart';

class DbManager {
  static Database _database;

  //static AlarmHelper _alarmHelper;

  /*AlarmHelper._createInstance();
  factory AlarmHelper() {
    if (_alarmHelper == null) {
      _alarmHelper = AlarmHelper._createInstance();
    }
    return _alarmHelper;
  }*/

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "alarm.db";
    print(path);

    //Apro la connessione con il db:
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        //Query SQL:
        //tabella sveglie
        /*db.execute(''' 
          create table $tableAlarm ( 
          $columnId integer primary key autoincrement, 
          $columnTitle text not null,
          $columnDateTime text not null,
          $columnPending integer,
          $columnColorIndex integer)
        ''');*/
        //tabella medicine
        db.execute(
            'CREATE TABLE tableMedicine (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, numPills INTEGER, hour TIME, days STRING)');
      },
    );
    return database;
  }

  /*void insertAlarm(AlarmInfo alarmInfo) async {
    //Inserisco nel db la sveglia che ho appena impostato nella UI
    var db = await this.database;
    var result =
        await db.insert(tableAlarm, alarmInfo.toMap()); //toMap = toJSON
    print('result : $result');
  }*/

  Future<int> insertMedicine(Medicine medicine) async {
    //Inserisco nel db la sveglia che ho appena impostato nella UI
    var db = await this.database;
    var result =
        await db.insert('tableMedicine', medicine.toMap()); //toMap = toJSON
    print('result : $result');

    return result;
  }

  Future<int> getId(Medicine medicine) async {
    var db = await this.database;
    var result = await db.rawQuery(
        "SELECT id FROM tableMedicine WHERE name = '" +
            medicine.name +
            "' AND numPills = '" +
            medicine.numPills.toString() +
            "' AND hour = '" +
            medicine.hour +
            "' AND days = '" +
            medicine.days +
            "'");

    var id;
    result.forEach((element) {
      id = int.parse(element['id'].toString());
    });

    return id;
  }

  void deleteMedicine(Medicine medicine) async {
    //Inserisco nel db la sveglia che ho appena impostato nella UI
    var db = await this.database;

    var id = await getId(medicine);

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

    db.execute("DELETE  FROM tableMedicine WHERE name = '" +
        medicine.name +
        "' AND numPills = '" +
        medicine.numPills.toString() +
        "' AND hour = '" +
        medicine.hour +
        "' AND days = '" +
        medicine.days +
        "'");
  }

  void modMedicine(id, Medicine medicine) async {
    //Inserisco nel db la sveglia che ho appena impostato nella UI
    var db = await this.database;

    db.execute("UPDATE tableMedicine SET name = '" +
        medicine.name +
        "', numPills = '" +
        medicine.numPills.toString() +
        "', hour = '" +
        medicine.hour +
        "', days = '" +
        medicine.days +
        "' WHERE id='" +
        id.toString() +
        "'");
  }

  void creaTabella() async {
    var db = await this.database;
    db.execute(
        'CREATE TABLE tableMedicine (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, numPills INTEGER, hour TIME, days STRING)');
  }

  /*Future<List<AlarmInfo>> getAlarms() async {
    List<AlarmInfo> _alarms = [];

    var db = await this.database;
    var result =
        await db.query(tableAlarm); //ottengo la lista degli elementi del db
    result.forEach((element) {
      var alarmInfo = AlarmInfo.fromMap(element);
      _alarms.add(alarmInfo);
    });

    return _alarms;
  }*/

  Future<List<Medicine>> getMedicine() async {
    List<Medicine> _medicine = [];

    var db = await this.database;
    var result = await db
        .query('tableMedicine'); //ottengo la lista degli elementi del db
    result.forEach((element) {
      var medicine = Medicine.fromMap(element);
      _medicine.add(medicine);
    });

    return _medicine;
  }

  /*Future<int> delete(int id) async {
    var db = await this.database;
    return await db.delete(tableAlarm, where: '$columnId = ?', whereArgs: [id]);
  }*/
}
