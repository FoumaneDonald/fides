import 'package:flutter/material.dart';

class RequiredFieldText extends StatelessWidget {
  const RequiredFieldText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('All fields marked (*) are required', style: Theme.of(context).textTheme.bodyMedium);
  }
}
