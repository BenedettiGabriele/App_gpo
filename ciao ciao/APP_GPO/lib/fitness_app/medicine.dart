class Medicine {
  String name;
  int numPills;
  String hour;
  String days;

  Medicine(this.name, this.numPills, this.hour, this.days);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'numPills': numPills,
      'hour': hour,
      'days': days,
    };
  }

  static Medicine fromMap(Map<String, dynamic> medicine) {
    return new Medicine(medicine['name'], medicine['numPills'],
        medicine['hour'].toString(), medicine['days'].toString());
  }
}
