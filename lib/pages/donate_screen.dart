import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonateScreen extends StatefulWidget {
  final String? category;

  DonateScreen({this.category});

  @override
  _DonateScreenState createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  bool _available = true;
  File? _image;
  bool _isSubmitting = false;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _takePhoto() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _submitDonation() async {
    if (_formKey.currentState!.validate()) {
      if (_image == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please attach an image')),
        );
        return;
      }

      setState(() {
        _isSubmitting = true;
      });

      try {
        // Upload image to Firebase Storage
        final storageRef = FirebaseStorage.instance.ref().child('donations/${DateTime.now().millisecondsSinceEpoch}');
        final uploadTask = storageRef.putFile(_image!);
        final taskSnapshot = await uploadTask;
        final imageUrl = await taskSnapshot.ref.getDownloadURL();

        // Save donation data to Firestore
        await FirebaseFirestore.instance.collection('donations').add({
          'name': _nameController.text,
          'description': _descriptionController.text,
          'location': _locationController.text,
          'imageUrl': imageUrl,
          'available': _available,
          'category': widget.category,
          'createdAt': FieldValue.serverTimestamp(),
        });

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Donation submitted successfully!')),
        );

        // Clear the form
        _nameController.clear();
        _descriptionController.clear();
        _locationController.clear();
        setState(() {
          _image = null;
          _available = true;
          _isSubmitting = false;
        });
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit donation. Please try again.')),
        );
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Donate Item'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              if (widget.category != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Category: ${widget.category}',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
              TextFormField(
                key: Key('nameField'),
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Item Name',
                  labelStyle: TextStyle(color: Colors.green),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                key: Key('descriptionField'),
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(color: Colors.green),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                key: Key('locationField'),
                controller: _locationController,
                decoration: InputDecoration(
                  labelText: 'Location',
                  labelStyle: TextStyle(color: Colors.green),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the location';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: _pickImage,
                    icon: Icon(Icons.photo_library),
                    label: Text('Gallery'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _takePhoto,
                    icon: Icon(Icons.camera_alt),
                    label: Text('Camera'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              if (_image != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Image.file(
                    _image!,
                    height: 200,
                  ),
                ),
              SwitchListTile(
                title: Text('Available'),
                value: _available,
                onChanged: (bool value) {
                  setState(() {
                    _available = value;
                  });
                },
                activeColor: Colors.green,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _isSubmitting ? null : _submitDonation,
                child: _isSubmitting 
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : Text('Submit Donation'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
