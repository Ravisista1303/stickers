import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stickers/screens/birthday/database_helper.dart';
import 'package:stickers/screens/birthday/user.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

class BirthdayBody extends StatefulWidget {
  @override
  _BirthdayBodyState createState() => _BirthdayBodyState();
}

class _BirthdayBodyState extends State<BirthdayBody> {
  String valueChoose;
  List listItem = [
    'Upcoming',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  var monthConverter = {
    'Upcoming': -1,
    'January': 1,
    'February': 2,
    'March': 3,
    'April': 4,
    'May': 5,
    'June': 6,
    'July': 7,
    'August': 8,
    'September': 9,
    'October': 10,
    'November': 11,
    'December': 12
  };

  User _user = User();
  List<User> _users = [];
  List<User> _displayUsers = [];
  DatabaseHelper _dbHelper;
  final _formKey = GlobalKey<FormState>();
  final _ctrlName = TextEditingController();
  final _ctrlDAY = TextEditingController();
  final _ctrlMONTH = TextEditingController();
  final _ctrlYEAR = TextEditingController();

  @override
  void initState() {
    initializeSetting();
    tz.initializeTimeZones();
    super.initState();
    setState(() {
      _dbHelper = DatabaseHelper.instance;
    });
    _refreshUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
            child: Text('Add Birthdays',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[_form(), _list()],
          ),
        ));
  }

  _form() => Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _ctrlName,
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (val) => setState(() => _user.name = val),
                validator: (val) =>
                    (val.length == 0 ? 'This field is required' : null),
              ),
              TextFormField(
                controller: _ctrlDAY,
                decoration:
                    InputDecoration(labelText: 'Day', hintText: '(e.g) 01'),
                onSaved: (val) => setState(() => _user.day = val),
                validator: (val) =>
                    (val.length == 0 ? 'This field is required' : null),
              ),
              TextFormField(
                controller: _ctrlMONTH,
                decoration:
                    InputDecoration(labelText: 'Month', hintText: '(e.g) 06'),
                onSaved: (val) => setState(() => _user.month = val),
                validator: (val) =>
                    (val.length == 0 ? 'This field is required' : null),
              ),
              TextFormField(
                controller: _ctrlYEAR,
                decoration:
                    InputDecoration(labelText: 'Year', hintText: '(e.g) 1990'),
                onSaved: (val) => setState(() => _user.year = val),
                validator: (val) =>
                    (val.length == 0 ? 'This field is required' : null),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.all(10.0),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  child: Text('Submit'),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () => _onSubmit(),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(15)),
                    child: DropdownButton(
                      hint: Text('Filter Birthdays by month'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 36,
                      underline: SizedBox(),
                      isExpanded: true,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      value: valueChoose,
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose = newValue;
                          _filterUsers();
                        });
                      },
                      items: listItem.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  _filterUsers() {
    if (monthConverter[valueChoose] == -1) {
      _displayUsers = _users
          .where((element) =>
              int.parse(element.month) == DateTime.now().month &&
              int.parse(element.day) > DateTime.now().day)
          .toList();
    } else {
      _displayUsers = _users
          .where((element) =>
              int.parse(element.month) == monthConverter[valueChoose])
          .toList();
    }
  }

  _refreshUserList() async {
    List<User> x = await _dbHelper.fetchUsers();
    setState(() {
      _users = x;
      _displayUsers = _users;
    });
  }

  _onSubmit() async {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      if (_user.id == null)
        await _dbHelper.insertUser(_user);
      else
        await _dbHelper.updateUser(_user);
      _refreshUserList();
      _resetForm();
    }
  }

  _resetForm() {
    setState(() {
      _formKey.currentState.reset();
      _ctrlName.clear();
      _ctrlDAY.clear();
      _ctrlMONTH.clear();
      _ctrlYEAR.clear();
      _user.id = null;
    });
  }

  _list() => Expanded(
        child: Card(
          margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    leading: IconButton(
                      icon: Icon(Icons.notification_add, color: Colors.red),
                      onPressed: () {
                        displaynotification(_displayUsers[index].name, index);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Notification'),
                                content: Text(
                                    'You will receive a notification at 12:00 am.'),
                                actions: <Widget>[
                                  // ignore: deprecated_member_use
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Close'))
                                ],
                              );
                            });
                      },
                    ),
                    title: Text(
                      _displayUsers[index].name.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_displayUsers[index].day +
                        " / " +
                        _displayUsers[index].month +
                        " / " +
                        _displayUsers[index].year),
                    trailing: IconButton(
                        onPressed: () async {
                          await _dbHelper.deleteUser(_displayUsers[index].id);
                          _resetForm();
                          _refreshUserList();
                        },
                        icon: Icon(
                          Icons.delete_sweep,
                          color: Colors.black,
                        )),
                    onTap: () {
                      setState(() {
                        _user = _displayUsers[index];
                        _ctrlName.text = _displayUsers[index].name;
                        _ctrlDAY.text = _displayUsers[index].day;
                        _ctrlMONTH.text = _displayUsers[index].month;
                        _ctrlYEAR.text = _displayUsers[index].year;
                      });
                    },
                  ),
                  Divider(
                    height: 5.0,
                  )
                ],
              );
            },
            itemCount: _displayUsers.length,
          ),
        ),
      );
  Future<void> displaynotification(String name, index) async {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    var ms = (now).millisecondsSinceEpoch;
    var second = (ms / 1000).round();
    var d = _users[index].day;
    var m = _users[index].month;
    var y;

    if (now.month > int.parse(m)) {
      y = now.year + 1;
    } else {
      if (now.day > int.parse(d)) {
        y = now.year + 1;
      } else {
        y = now.year;
      }
    }

    var date = y.toString() + m + d + " 00:00:00";
    var later = DateTime.parse(date);
    var ms2 = later.millisecondsSinceEpoch;
    var second2 = (ms2 / 1000).round();
    var diff = second2 - second;
    print(diff);
    notificationsPlugin.zonedSchedule(
        0,
        name,
        "It's their Birthday!!!\nWish them",
        tz.TZDateTime.now(tz.local).add(Duration(seconds: diff)),
        NotificationDetails(
            iOS: IOSNotificationDetails(),
            android: AndroidNotificationDetails(
                "channelId", "channelName", "channelDescription")),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }
}

void initializeSetting() async {
  var initializeAndroid = AndroidInitializationSettings('my_logo');
  var intializeiOS = IOSInitializationSettings();
  var initializeSetting =
      InitializationSettings(android: initializeAndroid, iOS: intializeiOS);
  await notificationsPlugin.initialize(initializeSetting);
}
