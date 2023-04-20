import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class EditCarPage extends StatefulWidget {
  final String docId;


  EditCarPage({required this.docId});

  @override
  _EditCarPageState createState() => _EditCarPageState();
}

class _EditCarPageState extends State<EditCarPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _priceController;
  late TextEditingController _modelyearController;
  late TextEditingController _geartypeController;
  late TextEditingController _typeController;
  late TextEditingController _doorsController;
  late TextEditingController _engineController;
  late TextEditingController _passController;
  late TextEditingController _luggageController;
  late TextEditingController _descriptionController;
  late TextEditingController _imageurlController;


  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
     _addressController = TextEditingController();
     _priceController = TextEditingController();
     _modelyearController = TextEditingController();

     _geartypeController = TextEditingController();
     _typeController = TextEditingController();
     _doorsController = TextEditingController();
     _engineController = TextEditingController();
     _passController = TextEditingController();
     _luggageController = TextEditingController();
     _descriptionController = TextEditingController();
     _imageurlController = TextEditingController();
    _loadData();
  }

  @override
  void dispose() {










    _nameController.dispose();
    _addressController.dispose();
    _priceController.dispose();
    _modelyearController.dispose();

    _geartypeController.dispose();
    _typeController.dispose();
    _doorsController.dispose();
    _engineController.dispose();
    _passController.dispose();
    _luggageController.dispose();
    _descriptionController.dispose();
    _imageurlController.dispose();






    super.dispose();
  }

  void _loadData() async {
    final doc = await FirebaseFirestore.instance.collection('cars').doc(widget.docId).get();
    final data = doc.data() as Map<String, dynamic>;
    _nameController.text = data['name'];
    _addressController.text = data['address'];
    _priceController.text = data['price'].toString();
    _modelyearController.text = data['modelyear'];

    _geartypeController.text = data['geartype'];
    _typeController.text = data['type'];
    _doorsController.text = data['doors'];
    _engineController.text = data['engine'];
    _passController.text = data['pass'];
    _luggageController.text = data['luggage'];
    _descriptionController.text = data['description'];
    _imageurlController.text = data['imageurl'];

  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final address = _addressController.text.trim();
      final price = int.parse(_priceController.text.trim());
      final modelyear = _modelyearController.text.trim();
      final geartype = _geartypeController.text.trim();
      final type = _typeController.text.trim();
      final doors = _doorsController.text.trim();
      final engine = _engineController.text.trim();
      final pass = _passController.text.trim();
      final luggage = _luggageController.text.trim();

      final description = _descriptionController.text.trim();
      final imageurl = _imageurlController.text.trim();

      await FirebaseFirestore.instance.collection('cars').doc(widget.docId).update({
        'name': name,
        'address': address,
        'price': price,
        'modelyear': modelyear,
        'geartype': geartype,
        'type': type,
        'doors': doors,
        'engine': engine,
        'pass': pass,
        'luggage': luggage,
        'description': description,
        'imageurl': imageurl,
      });

      Navigator.pop(context);
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Car'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _addressController,
                    decoration: InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a city';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),


                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _priceController,
                    decoration: InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(),

                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Price';
                      }
                      final rating = int.tryParse(value);
                      if (rating == null || rating < 0 || rating > 50000000) {
                        return 'Please enter a rating between 0 and 5000000';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _modelyearController,
                    decoration: InputDecoration(
                      labelText: 'Model year',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Model Year';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _geartypeController,
                    decoration: InputDecoration(
                      labelText: 'Gear Type',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Gear Type';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _typeController,
                    decoration: InputDecoration(
                      labelText: 'Vehicle Type',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Vehicle Type';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _doorsController,
                    decoration: InputDecoration(
                      labelText: 'Doors',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Number of Doors';
                      }
                      final rating = int.tryParse(value);
                      if (rating == null || rating < 0 || rating > 10) {
                        return 'Please enter a rating between 0 and 5000000';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _engineController,
                    decoration: InputDecoration(

                      labelText: 'Engine Fuel',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Engine Fuel Type';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _passController,
                    decoration: InputDecoration(
                      labelText: 'Passengers',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Number of Seats';
                      }
                      final rating = int.tryParse(value);
                      if (rating == null || rating < 0 || rating > 70) {
                        return 'Please enter a rating between 0 and 5000000';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _luggageController,
                    decoration: InputDecoration(
                      labelText: 'Luggage',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Number of Luggages';
                      }
                      final rating = int.tryParse(value);
                      if (rating == null || rating < 0 || rating > 50000000) {
                        return 'Please enter a rating between 0 and 5000000';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),








                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),



                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _imageurlController,
                    decoration: InputDecoration(
                      labelText: 'Image',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Image  Url';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _submit,
                    child: Text('Save'),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
