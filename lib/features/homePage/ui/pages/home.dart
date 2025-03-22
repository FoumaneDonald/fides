import 'package:flutter/material.dart';

import '../widgets/latestCustomersSection.dart';
import '../widgets/loyalCustomersSection.dart';
import '../widgets/loyaltyProgramSection.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(leading: Icon(Icons.menu), title: Text('Home')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                LoyalCustomersSection(),
                SizedBox(height: 24),
                LoyaltyProgramSection(),
                SizedBox(height: 24),
                LatestCustomersSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
