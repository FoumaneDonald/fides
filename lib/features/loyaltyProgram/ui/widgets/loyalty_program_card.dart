import 'package:flutter/material.dart';

class LoyaltyProgramCardSelection extends StatelessWidget {
  final String _programName;
  final String _programDescription;
  final Widget _programIcon;
  final Function()? _onPressed;

  const LoyaltyProgramCardSelection({
    super.key,
    required String programName,
    required String programDescription,
    required Widget programIcon,
    Function()? onPressed,
  })  : _programName = programName,
        _programDescription = programDescription,
        _programIcon = programIcon,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: _onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerHigh,
                      borderRadius: BorderRadius.all(Radius.circular(99)),
                    ),
                    child: _programIcon,
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_rounded,
                  ),
                ],
              ),
              Column(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _programName,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    _programDescription,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
