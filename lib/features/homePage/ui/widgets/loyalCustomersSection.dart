import 'package:flutter/material.dart';

class LoyalCustomersSection extends StatelessWidget {
  const LoyalCustomersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Color(0xffFFAAA2),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('0'),
                Text('Loyal customers'),
              ],
            ),
          ),
          Flexible(
            child: FilledButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Customer'),
                  Icon(Icons.add_circle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
