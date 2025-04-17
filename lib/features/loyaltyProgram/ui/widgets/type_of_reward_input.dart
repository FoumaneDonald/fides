// Todo: delete
// import 'package:flutter/material.dart';
//
// import '../../../../services/helpers/reward_type_enum.dart';
//
// class TypeOfRewardInput<T> extends StatelessWidget {
//   const TypeOfRewardInput({
//     super.key,
//     required this.listTypeReward,
//     required this.selectedValue,
//     required this.onChanged,
//   });
//
//   final List<T> listTypeReward;
//   final T selectedValue;
//   final Function(T? newValue)? onChanged;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Type of reward*',
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         DropdownButtonFormField<T>(
//           value: selectedValue,
//           items: listTypeReward
//               .map(
//                 (reward) => DropdownMenuItem<T>(
//                   value: reward,
//                   child: Text(reward),
//                 ),
//               )
//               .toList(),
//           onChanged: onChanged,
//         ),
//       ],
//     );
//   }
// }
