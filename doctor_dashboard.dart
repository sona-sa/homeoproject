import 'package:flutter/material.dart';

import 'add_treatment_details.dart';
import 'book_appointments.dart';

class DoctorDashboard extends StatelessWidget {
  const DoctorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Doctor Dashboard")),
      body: Center( // Centers the entire column
        child: Column(
          mainAxisSize: MainAxisSize.min, // Keeps the column compact in the center
          crossAxisAlignment: CrossAxisAlignment.center, // Ensures buttons are centered horizontally
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookAppointmentsScreen()),
                );
              },
              child: Text('Book Appointments'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTreatmentDetails()),
                );
              },
              child: Text('Add Treatment Details'),
            ),
          ],
        ),
      ),
    );
  }
}
