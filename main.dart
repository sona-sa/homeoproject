import 'package:flutter/material.dart';
import 'staff_dashboard.dart';
import 'add_treatment_details.dart';
import 'book_appointments.dart';
import 'doctor_dashboard.dart';
import 'login_screen.dart';
import 'medicine_stock_management.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homeopathy Dispensary Management',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
      routes: {
        '/staffDashboard': (context) => StaffDashboard(),
        '/doctorDashboard': (context) => DoctorDashboard(),
        '/bookAppointments': (context) => BookAppointmentsScreen(),
        '/medicineStock': (context) => MedicineStockManagement(),
        '/addTreatmentDetails': (context) => AddTreatmentDetails(),
      },
    );
  }
}
