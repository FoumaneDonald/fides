import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../services/helpers/program_type_enum.dart';

class LoyaltyProgramCardSelection extends StatelessWidget {
  final String _programName;
  final String _programDescription;
  final String _programImage;
  final Function()? _onPressed;

  const LoyaltyProgramCardSelection({
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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .14,
                      height: MediaQuery.of(context).size.height * .06,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          _programImage,
                          semanticsLabel: 'Program icon',
                          width: 16,
                          height: 24,
                          colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.surfaceDim, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
