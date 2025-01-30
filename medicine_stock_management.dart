import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MedicineStockManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Medicine Stock Management")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Medicine Name:"),
            TextField(),
            SizedBox(height: 20),
            Text("Stock Quantity:"),
            TextField(),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                // Check and show stock-out notifications if stock is zero
              },
              child: Text('Update Stock'),
            ),
          ],
        ),
      ),
    );
  }
}
