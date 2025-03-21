import 'package:flutter/material.dart';

import '../widgets/loyal_customers_section.dart';
import '../widgets/loyalty_program_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(leading: Icon(Icons.menu), title: Text('Home page')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                LoyalCustomersSection(),
                SizedBox(
                  height: 24,
                ),
                LoyaltyProgramSection(),
                SizedBox(
                  height: 24,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Latest customers'),
                        Text('see all'),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text('Today'),
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: 2,
                        separatorBuilder: (BuildContext context, int index) => SizedBox(width: 16),
                        itemBuilder: (context, index) => Container(
                          width: 140,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 32,
                                width: 32,
                                child: Placeholder(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
