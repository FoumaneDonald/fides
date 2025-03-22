import 'package:flutter/material.dart';

class LatestCustomersSection extends StatelessWidget {
  const LatestCustomersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            separatorBuilder: (BuildContext context, int index) => SizedBox(height: 8),
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.grey[200]
              ),
              width: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 32,
                    width: 32,
                    child: Placeholder(),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Customer name'),
                        Text('Phone number'),
                      ],
                    ),
                  ),
                  SizedBox(width: 16,),
                  Icon(Icons.arrow_right_outlined),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
