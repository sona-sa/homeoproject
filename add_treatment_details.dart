import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTreatmentDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Treatment Details")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Diagnosis Name'),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Prescription (Medicines)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                // Add treatment details and save
              },
              child: Text('Save Treatment Details'),
            ),
          ],
        ),
      ),
    );
  }
}
