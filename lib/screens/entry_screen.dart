import 'package:flutter/material.dart';
import '../models/policy.dart';
import '../utils/data_store.dart';

class EntryScreen extends StatefulWidget {
  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  String branch = "Kohuwala";
  String introducer = "Agent A";

  final nameCtrl = TextEditingController();
  final policyCtrl = TextEditingController();
  final premiumCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Policy")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nameCtrl, decoration: InputDecoration(labelText: "Customer Name")),
            TextField(controller: policyCtrl, decoration: InputDecoration(labelText: "Policy Number")),
            TextField(controller: premiumCtrl, decoration: InputDecoration(labelText: "Premium"), keyboardType: TextInputType.number),

            DropdownButton<String>(
              value: branch,
              items: ["Kohuwala", "Nugegoda"]
                  .map((b) => DropdownMenuItem(value: b, child: Text(b)))
                  .toList(),
              onChanged: (v) => setState(() => branch = v!),
            ),

            DropdownButton<String>(
              value: introducer,
              items: ["Agent A", "Agent B", "Agent C"]
                  .map((i) => DropdownMenuItem(value: i, child: Text(i)))
                  .toList(),
              onChanged: (v) => setState(() => introducer = v!),
            ),

            ElevatedButton(
              onPressed: () {
                DataStore.policies.add(Policy(
                  customerName: nameCtrl.text,
                  policyNumber: policyCtrl.text,
                  branch: branch,
                  introducer: introducer,
                  premium: double.parse(premiumCtrl.text),
                  date: DateTime.now(),
                ));
                Navigator.pop(context);
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
