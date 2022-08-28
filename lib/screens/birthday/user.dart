class User {
  static const tblUser = 'users';
  static const colId = 'id';
  static const colName = 'name';
  static const colDAY = 'day';
  static const colMONTH = 'month';
  static const colYEAR = 'year';

  User({this.id, this.name, this.day, this.month, this.year});

  User.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    name = map[colName];
    day = map[colDAY];
    month = map[colMONTH];
    year = map[colYEAR];
  }

  int id;
  String name, day, month, year;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colName: name,
      colDAY: day,
      colMONTH: month,
      colYEAR: year
    };
    if (id != null) map[colId] = id;
    return map;
  }
}
