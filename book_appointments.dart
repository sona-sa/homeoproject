import 'package:flutter/material.dart';

class BookAppointmentsScreen extends StatefulWidget {
  const BookAppointmentsScreen({super.key});

  @override
  _BookAppointmentsScreenState createState() => _BookAppointmentsScreenState();
}

class _BookAppointmentsScreenState extends State<BookAppointmentsScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Example list of patients
  final List<Map<String, String>> _patients = [
    {'id': '001', 'name': 'John Doe', 'phone': '1234567890', 'age': '30', 'gender': 'Male', 'reason': 'Checkup'},
    {'id': '002', 'name': 'Jane Smith', 'phone': '9876543210', 'age': '25', 'gender': 'Female', 'reason': 'Fever'},
    {'id': '003', 'name': 'Alice Brown', 'phone': '5551234567', 'age': '40', 'gender': 'Female', 'reason': 'Follow-up'},
  ];

  Map<String, String>? _searchedPatient;
  String? _searchMessage; // Store the search message

  void _searchPatient() {
    setState(() {
      final idQuery = _idController.text.trim();
      final nameQuery = _nameController.text.trim().toLowerCase();
      final phoneQuery = _phoneController.text.trim();

      _searchedPatient = _patients.firstWhere(
            (patient) =>
        (idQuery.isNotEmpty && patient['id'] == idQuery) ||
            (nameQuery.isNotEmpty && patient['name']!.toLowerCase() == nameQuery) ||
            (phoneQuery.isNotEmpty && patient['phone'] == phoneQuery),
        orElse: () => <String, String>{}, // Return an empty Map
      );

      if (_searchedPatient!.isEmpty) {
        _searchedPatient = null; // No patient found
        _searchMessage = "No results found";
      } else {
        _searchMessage = null; // Reset message when a patient is found
      }
    });
  }

  void _addNewPatient() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewPatientScreen(
          onSave: (newPatient) {
            setState(() {
              _patients.add(newPatient);
              _searchedPatient = newPatient;
            });
          },
        ),
      ),
    );
  }

  void _addAppointment() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddAppointmentScreen(patient: _searchedPatient!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book Appointments")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'Search by Patient ID'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Search by Patient Name'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Search by Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchPatient,
              child: Text('Search Patient'),
            ),
            SizedBox(height: 20),
            if (_searchedPatient != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Patient Details:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('ID: ${_searchedPatient!['id']}'),
                  Text('Name: ${_searchedPatient!['name']}'),
                  Text('Age: ${_searchedPatient!['age']}'),
                  Text('Gender: ${_searchedPatient!['gender']}'),
                  Text('Phone: ${_searchedPatient!['phone']}'),
                  Text('Reason: ${_searchedPatient!['reason']}'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _addAppointment,
                    child: Text('Add Appointment'),
                  ),
                ],
              )
            else if (_searchMessage != null)
              Text(_searchMessage!, style: TextStyle(color: Colors.red, fontSize: 16)), // Display "No results found"
          ],
        ),
      ),
    );
  }
}

class AddNewPatientScreen extends StatefulWidget {
  final Function(Map<String, String>) onSave;

  const AddNewPatientScreen({required this.onSave, super.key});

  @override
  _AddNewPatientScreenState createState() => _AddNewPatientScreenState();
}

class _AddNewPatientScreenState extends State<AddNewPatientScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _newPatient = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Patient")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Patient ID'),
                onSaved: (value) => _newPatient['id'] = value!,
                validator: (value) => value == null || value.isEmpty ? 'Enter patient ID' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) => _newPatient['name'] = value!,
                validator: (value) => value == null || value.isEmpty ? 'Enter patient name' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _newPatient['age'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Gender'),
                onSaved: (value) => _newPatient['gender'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                onSaved: (value) => _newPatient['phone'] = value!,
                validator: (value) => value == null || value.isEmpty ? 'Enter phone number' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Reason for Visit'),
                onSaved: (value) => _newPatient['reason'] = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    widget.onSave(_newPatient);
                    Navigator.pop(context);
                  }
                },
                child: Text('Save Patient'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddAppointmentScreen extends StatelessWidget {
  final Map<String, String> patient;

  const AddAppointmentScreen({required this.patient, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Appointment")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Adding Appointment for:', style: TextStyle(fontSize: 18)),
            Text('Name: ${patient['name']}'),
            Text('ID: ${patient['id']}'),
            Text('Phone: ${patient['phone']}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Save Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
