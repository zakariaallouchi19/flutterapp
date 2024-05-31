
import 'package:flutter/material.dart';
import 'notification.dart';
import 'package:table_calendar/table_calendar.dart';
import 'policy.dart';
import 'profil.dart';



class CalendarPage extends StatelessWidget {
  void _showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          title: Text('Alert'),
          content: Text('Are you sure you want to cancel the reservation?'),
          actions: <Widget>[
            TextButton(
              child: Text("YES"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("NO"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          title: Text('Update'),
          content: Text('Reservation has been successfully updated'),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/soocer.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
              padding: EdgeInsets.all(20),
              child: Center(
                child: Calendar(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add_rounded),
            label: 'notification',
          ),
        
          BottomNavigationBarItem(
            icon: Icon(Icons.policy),
            label: 'Policy',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          _onItemTapped(context, index);
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _showUpdateDialog(context),
            tooltip: 'Update',
            child: Icon(Icons.update),
            backgroundColor: Colors.blue,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => _showCancelDialog(context),
            tooltip: 'Delete',
            child: Icon(Icons.delete),
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Notif()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PolicyPage()),
        );
        break;
        
    }
  }
}

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late int _selectedYear;
  late int _selectedMonth;
  late int _selectedDay;
  late String _selectedTime;
  final List<List<String>> _monthsDays = [
    List.generate(31, (index) => (index + 1).toString()), // January
    List.generate(28, (index) => (index + 1).toString()), // February
    List.generate(31, (index) => (index + 1).toString()), // March
    List.generate(30, (index) => (index + 1).toString()), // April
    List.generate(31, (index) => (index + 1).toString()), // May
    List.generate(30, (index) => (index + 1).toString()), // June
    List.generate(31, (index) => (index + 1).toString()), // July
    List.generate(31, (index) => (index + 1).toString()), // August
    List.generate(30, (index) => (index + 1).toString()), // September
    List.generate(31, (index) => (index + 1).toString()), // October
    List.generate(30, (index) => (index + 1).toString()), // November
    List.generate(31, (index) => (index + 1).toString()), // December
  ];
  final List<String> _hours = List.generate(48, (index) {
    final int hours = index ~/ 2;
    final int minutes = index % 2 == 0 ? 0 : 30;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  });

  @override
  void initState() {
    super.initState();
    _selectedYear = DateTime.now().year; // Current year by default
    _selectedMonth = DateTime.now().month - 1; // Current month by default
    _selectedDay = DateTime.now().day; // Current day by default
    _selectedTime = _hours[0]; // 00:00 by default
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton<int>(
            value: _selectedYear,
            onChanged: (int? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedYear = newValue;
                });
              }
            },
            items: List<DropdownMenuItem<int>>.generate(
              10,
              (index) => DropdownMenuItem<int>(
                value: DateTime.now().year + index,
                child: Text((DateTime.now().year + index).toString()),
              ),
            ),
          ),
          DropdownButton<int>(
            value: _selectedMonth,
            onChanged: (int? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedMonth = newValue;
                  _selectedDay = 1; // Reset day to 1st of the new month
                });
              }
            },
            items: List<DropdownMenuItem<int>>.generate(
              12,
              (index) => DropdownMenuItem<int>(
                value: index,
                child: Text(_getMonthName(index)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Wrap(
            alignment: WrapAlignment.center,
            children: _monthsDays[_selectedMonth]
                .map((day) => _buildDay(day))
                .toList(),
          ),
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 10),
          Text(
            'Choose the time:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          DropdownButton<String>(
            value: _selectedTime,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedTime = newValue;
                });
              }
            },
            items: _hours.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                _submitDateTime(context);
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDay(String day) {
    final int dayInt = int.tryParse(day) ?? 1;
    final bool isSelected = dayInt == _selectedDay;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDay = dayInt;
        });
      },
      child: Container(
        width: 36.57,
        height: 40,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            day,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Color(0xFF181819),
              fontSize: 13,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  void _submitDateTime(BuildContext context) {
    final DateTime selectedDateTime = DateTime(
      _selectedYear,
      _selectedMonth + 1,
      _selectedDay,
      int.parse(_selectedTime.split(':')[0]),
      int.parse(_selectedTime.split(':')[1]),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected Date and Time: $selectedDateTime'),
      ),
    );
  }

  String _getMonthName(int monthIndex) {
    final List<String> months = [
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
      'December',
    ];
    return months[monthIndex];
  }
}

