import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../services/helpers/program_type_enum.dart';

class LoyaltyProgramCard extends StatelessWidget {
  final String _programName;
  final String _programDescription;
  final String _programImage;
  final Function()? _onPressed;

  const LoyaltyProgramCard({
    super.key,
    required String programName,
    required String programDescription,
    required String programImage,
    Function()? onPressed,
  })  : _programName = programName,
        _programDescription = programDescription,
        _programImage = programImage,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: _onPressed,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .15,
                height: MediaQuery.of(context).size.height * .07,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryFixedDim,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    _programImage,
                    semanticsLabel: 'Program icon',
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onPrimaryFixedVariant, BlendMode.srcIn),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _programName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      _programDescription,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Icon(
                Icons.keyboard_arrow_right_rounded,
              )
            ],
          ),
        ),
      ),
    );
  }
}
