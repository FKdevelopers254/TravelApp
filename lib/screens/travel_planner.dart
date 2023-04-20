import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TravelPlannerPage extends StatefulWidget {
  @override
  _TravelPlannerPageState createState() => _TravelPlannerPageState();
}

class _TravelPlannerPageState extends State<TravelPlannerPage> {
  final _formKey = GlobalKey<FormState>();
  late String _location;
  late int _days;
  late DateTime _checkInDate;
  late DateTime _checkOutDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Where do you want to go?'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a location';
                  }
                  return null;
                },
                onSaved: (value) {
                  _location = value!;
                },
              ),
              SizedBox(height: 16.0),
              Text('How many days do you plan to stay?'),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the number of days';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _days = int.parse(value!);
                },
              ),
              SizedBox(height: 16.0),
              Text('When do you plan to check in?'),
              GestureDetector(
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  setState(() {
                    _checkInDate = selectedDate!;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: _checkInDate == null
                      ? Text('Select Check-In Date')
                      : Text('${_checkInDate.day}/${_checkInDate.month}/${_checkInDate.year}'),
                ),
              ),
              SizedBox(height: 16.0),
              Text('When do you plan to check out?'),
              GestureDetector(
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: _checkInDate,
                    lastDate: DateTime(2100),
                  );
                  setState(() {
                    _checkOutDate = selectedDate!;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: _checkOutDate == null
                      ? Text('Select Check-Out Date')
                      : Text('${_checkOutDate.day}/${_checkOutDate.month}/${_checkOutDate.year}'),
                ),
              ),
              SizedBox(height: 16.0),
              MaterialButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final hotels = await _getHotels();
                    final cars = await _getCars();
                    // Navigate to the results page and












// pass the hotels and cars data to it
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsPage(
                          hotels: hotels,
                          cars: cars,
                        ),
                      ),
                    );
                  }
                },
                child: Text('Search'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> _getHotels() async {
// Query the Firebase collection for hotels in the selected location
    final snapshot = await FirebaseFirestore.instance
        .collection('hotels')
        .where('location', isEqualTo: _location)
        .get();
// Return a list of hotel data
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> _getCars() async {
// Query the Firebase collection for cars in the selected location
    final snapshot = await FirebaseFirestore.instance
        .collection('cars')
        .where('location', isEqualTo: _location)
        .get();
// Return a list of car data
    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}

class ResultsPage extends StatelessWidget {
  final List<Map<String, dynamic>> hotels;
  final List<Map<String, dynamic>> cars;

  ResultsPage({required this.hotels, required this.cars});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Hotels:'),
            ...hotels.map(
                  (hotel) => ListTile(
                title: Text(hotel['name']),
                subtitle: Text('${hotel['price']} per night'),
              ),
            ),
            SizedBox(height: 16.0),
            Text('Cars:'),
            ...cars.map(
                  (car) => ListTile(
                title: Text(car['name']),
                subtitle: Text('${car['price']} per day'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
