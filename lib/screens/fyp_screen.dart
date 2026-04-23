import 'package:flutter/material.dart';
import '../models/fyp.dart';
import '../utils/data_store.dart';

class FYPScreen extends StatelessWidget {
  final ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Monthly FYP")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: ctrl,
              decoration: InputDecoration(labelText: "FYP Amount"),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                DataStore.fypList.add(
                  FYP(month: DateTime.now().toString(), amount: double.parse(ctrl.text)),
                );
                Navigator.pop(context);
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
