import 'package:flutter/material.dart';

class AboutStampCard extends StatefulWidget {
  const AboutStampCard({super.key});

  @override
  State<AboutStampCard> createState() => _AboutStampCardState();
}

class _AboutStampCardState extends State<AboutStampCard> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberPunchHolesController = TextEditingController();
  final List<num> _giftHoles = [];
  final GlobalKey _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Stamp based program'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Text('About stamp-based program'),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
