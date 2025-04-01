import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.fromLTRB(16.0, 16, 0, 16),
          child: SizedBox(
            height: 92,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 138,
                  decoration: BoxDecoration(
                    color: Color(0xff40B7BF),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
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
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right_rounded,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
