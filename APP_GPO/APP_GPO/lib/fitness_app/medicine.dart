class Medicine {
  String name;
  int numPills;
  String hour;

  Medicine(this.name, this.numPills, this.hour);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'numPills': numPills,
      'hour': hour,
    };
  }

  static Medicine fromMap(Map<String, dynamic> medicine) {
    return new Medicine(
        medicine['name'], medicine['numPills'], medicine['hour'].toString());
  }
}
