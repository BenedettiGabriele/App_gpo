import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:best_flutter_ui_templates/fitness_app/medicine.dart';

//Informazioni usate per creare la tabella nel database
final String tableAlarm = 'alarm';
final String columnId = 'id';
final String columnTitle = 'title';
final String columnDateTime = 'alarmDateTime';
final String columnPending = 'isPending';
final String columnColorIndex = 'gradientColorIndex';

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
            'CREATE TABLE tableMedicine (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, numPills INTEGER, hour TIME)');
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

  void insertMedicine(Medicine medicine) async {
    //Inserisco nel db la sveglia che ho appena impostato nella UI
    var db = await this.database;
    var result =
        await db.insert('tableMedicine', medicine.toMap()); //toMap = toJSON
    print('result : $result');
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
