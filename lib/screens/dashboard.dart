import 'package:flutter/material.dart';
import '../utils/data_store.dart';
import '../utils/calculations.dart';
import 'entry_screen.dart';
import 'fyp_screen.dart';
import 'target_screen.dart';

class DashboardScreen extends StatelessWidget {
  final double designationTarget = 850000;
  final double branchTarget = 425000;

  @override
  Widget build(BuildContext context) {
    double total = monthlyPremium(DataStore.policies);
    double kohuwala = branchPremium(DataStore.policies, "Kohuwala");
    double nugegoda = branchPremium(DataStore.policies, "Nugegoda");
    double yearly = yearlyTotal(DataStore.policies, DataStore.fypList);

    return Scaffold(
      appBar: AppBar(title: Text("Target Tracker")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text("Monthly Progress"),
            LinearProgressIndicator(value: total / designationTarget),
            Text("Rs. $total / $designationTarget"),

            SizedBox(height: 20),

            Text("Kohuwala"),
            LinearProgressIndicator(value: kohuwala / branchTarget),

            Text("Nugegoda"),
            LinearProgressIndicator(value: nugegoda / branchTarget),

            SizedBox(height: 20),

            Text("MDRT Progress"),
            LinearProgressIndicator(value: yearly / 7955000),

            Text("COT Progress"),
            LinearProgressIndicator(value: yearly / 23865000),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => EntryScreen()));
              },
              child: Text("Add Policy"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => FYPScreen()));
              },
              child: Text("Add FYP"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => TargetScreen()));
              },
              child: Text("Targets"),
            ),
          ],
        ),
      ),
    );
  }
