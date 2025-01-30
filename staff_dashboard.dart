import 'package:flutter/material.dart';
import 'book_appointments.dart'; // Add the correct path if the file is in another folder
import 'medicine_stock_management.dart'; // Add the correct path if the file is in another folder

class StaffDashboard extends StatelessWidget {
  const StaffDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Staff Dashboard")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  // Navigate to book appointments screen
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
                  // Navigate to medicine stock management screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MedicineStockManagement()),
                  );
                },
                child: Text('Manage Medicine Stock'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
