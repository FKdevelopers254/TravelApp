import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditHotelPage extends StatefulWidget {
  final String docId;

  EditHotelPage({required this.docId});

  @override
  _EditHotelPageState createState() => _EditHotelPageState();
}

class _EditHotelPageState extends State<EditHotelPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _cityController;
  late TextEditingController _ratingController;
  late TextEditingController _imageController;
  late TextEditingController _descriptionController;
  late TextEditingController _room1nameController;
  late TextEditingController _room2nameController;
  late TextEditingController _room3nameController;
  late TextEditingController _room1priceController;
  late TextEditingController _room2priceController;
  late TextEditingController _room3priceController;
  late TextEditingController _room1typeController;
  late TextEditingController _room2typeController;
  late TextEditingController _room3typeController;
  late TextEditingController _room1photoController;
  late TextEditingController _room2photoController;
  late TextEditingController _room3photoController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _cityController = TextEditingController();
    _ratingController = TextEditingController();
    _imageController = TextEditingController();
    _descriptionController = TextEditingController();
    _room1nameController = TextEditingController();
    _room2nameController = TextEditingController();
    _room3nameController = TextEditingController();
    _room1priceController = TextEditingController();
    _room2priceController = TextEditingController();
    _room3priceController = TextEditingController();
    _room1typeController = TextEditingController();
    _room2typeController = TextEditingController();
    _room3typeController = TextEditingController();
    _room1photoController = TextEditingController();
    _room2photoController = TextEditingController();
    _room3photoController = TextEditingController();
    _loadData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _cityController.dispose();
    _ratingController.dispose();
    _imageController.dispose();
    _descriptionController.dispose();
    _room1nameController.dispose();
    _room2nameController.dispose();
    _room3nameController.dispose();
    _room1priceController.dispose();
    _room2priceController.dispose();
    _room3priceController.dispose();
    _room1typeController.dispose();
    _room2typeController.dispose();
    _room3typeController.dispose();
    _room1photoController.dispose();
    _room2photoController.dispose();
    _room3photoController.dispose();
    super.dispose();
  }

  void _loadData() async {
    final doc = await FirebaseFirestore.instance.collection('hotels').doc(widget.docId).get();
    final data = doc.data() as Map<String, dynamic>;
    _nameController.text = data['name'];
    _cityController.text = data['address'];
    _ratingController.text = data['price'].toString();
    _imageController.text = data['imageurl'];
    _descriptionController.text = data['description'];
    _room1nameController.text = data['room1name'];
    _room2nameController.text = data['room2name'];
    _room3nameController.text = data['room3name'];
    _room1priceController.text = data['room1price'].toString();
    _room2priceController.text = data['room2price'].toString();
    _room3priceController.text = data['room3price'].toString();
    _room1typeController.text = data['room1type'];
    _room2typeController.text = data['room2type'];
    _room3typeController.text = data['room3type'];
    _room1photoController.text = data['room1photo'];
    _room2photoController.text = data['room2photo'];
    _room3photoController.text = data['room3photo'];


  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final city = _cityController.text.trim();
      final rating = int.parse(_ratingController.text.trim());
      final imageurl = _imageController.text.trim();
      final description = _descriptionController.text.trim();
      final room1photo = _room1photoController.text.trim();
      final room2photo = _room2photoController.text.trim();
      final room3photo = _room3photoController.text.trim();
      final room1type = _room1typeController.text.trim();
      final room2type = _room2typeController.text.trim();
      final room3type = _room3typeController.text.trim();
      final room1price = int.parse(_room1priceController.text.trim());
      final room2price = int.parse(_room2priceController.text.trim());
      final room3price = int.parse(_room3priceController.text.trim());
      final room1name = _room1nameController.text.trim();
      final room2name = _room2nameController.text.trim();
      final room3name = _room3nameController.text.trim();


      await FirebaseFirestore.instance.collection('hotels').doc(widget.docId).update({
        'name': name,
        'address': city,
        'price': rating,
        'imageurl': imageurl,
        'description': description,
        'room1name': room1name,
        'room2name': room2name,
        'room3name': room3name,
        'room1type': room1type,
        'room2type': room2type,
        'room3type': room3type,
        'room1price': room1price,
        'room2price': room2price,
        'room3price': room3price,
        'room1photo': room1photo,
        'room2photo': room2photo,
        'room3photo': room3photo,
      });

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Hotel'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      labelText: 'City',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a city';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _ratingController,
                    decoration: InputDecoration(
                      labelText: 'Price',
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
                  TextFormField(
                    controller: _imageController,
                    decoration: InputDecoration(
                      labelText: 'Image',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Image  Url';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a text';
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                    controller: _room1nameController,
                    decoration: InputDecoration(
                      labelText: 'Room 1 Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _room1typeController,
                    decoration: InputDecoration(
                      labelText: 'Room 1 Type',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _room1priceController,
                    decoration: InputDecoration(
                      labelText: 'Room 1 price',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _room1photoController,
                    decoration: InputDecoration(
                      labelText: 'Room 1 Photo',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a text';
                      }
                      return null;
                    },
                  ),


                  TextFormField(
                    controller: _room2nameController,
                    decoration: InputDecoration(
                      labelText: 'Room 2 Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _room2typeController,
                    decoration: InputDecoration(
                      labelText: 'Room 2 Type',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _room2priceController,
                    decoration: InputDecoration(
                      labelText: 'Room 2 price',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _room2photoController,
                    decoration: InputDecoration(
                      labelText: 'Room 2 Photo',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a text';
                      }
                      return null;
                    },
                  ),




                  TextFormField(
                    controller: _room3nameController,
                    decoration: InputDecoration(
                      labelText: 'Room 3 Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _room3typeController,
                    decoration: InputDecoration(
                      labelText: 'Room 3 Type',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _room3priceController,
                    decoration: InputDecoration(
                      labelText: 'Room 3 price',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _room3photoController,
                    decoration: InputDecoration(
                      labelText: 'Room 3 Photo',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a text';
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
