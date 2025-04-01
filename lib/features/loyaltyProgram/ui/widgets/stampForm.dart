// import 'package:flutter/material.dart';
//
// class Stampform extends StatelessWidget {
//   final GlobalKey _formKey;
//   final TextEditingController _nameController;
//   final TextEditingController _numberPunchHolesController;
//
//   Stampform({
//     super.key,
//     required GlobalKey formKey,
//     required TextEditingController nameController,
//     required TextEditingController numberPunchHolesController,
//   })  : _formKey = formKey,
//         _nameController = nameController,
//         _numberPunchHolesController = numberPunchHolesController;
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Form(
//         key: _formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Name',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 TextFormField(
//                   controller: _nameController,
//                   decoration: InputDecoration(hintText: 'Coffee club reward'),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Number of punch holes',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 TextFormField(
//                   controller: _numberPunchHolesController,
//                   keyboardType: TextInputType.number,
//                   onFieldSubmitted: (value) {
//                     setState(() {
//                       _numberPunchHolesController.text = value;
//                       createHoles(int.parse(_numberPunchHolesController.text));
//                     });
//                   },
//                   decoration: InputDecoration(
//                     prefixIcon: IconButton(
//                       onPressed: () {
//                         final currentNumber = int.parse(_numberPunchHolesController.text);
//                         if (currentNumber > 0) {
//                           final updatedNumber = currentNumber - 1;
//                           setState(() {
//                             _numberPunchHolesController.text = updatedNumber.toString();
//                             createHoles(updatedNumber);
//                           });
//                         }
//                       },
//                       icon: Icon(Icons.remove),
//                     ),
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                         final currentNumber = int.parse(_numberPunchHolesController.text);
//                         if (currentNumber >= 0) {
//                           final updatedNumber = currentNumber + 1;
//                           setState(() {
//                             _numberPunchHolesController.text = updatedNumber.toString();
//                             createHoles(updatedNumber);
//                           });
//                         }
//                       },
//                       icon: Icon(Icons.add),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Select which number wins a gift',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 Wrap(
//                   spacing: 10,
//                   runSpacing: 12,
//                   children: _giftHoles.map(
//                     (number) {
//                       final isSelected = selectedNumbers.contains(number.toInt());
//                       return InkWell(
//                         onTap: () {
//                           setState(() {
//                             if (isSelected) {
//                               selectedNumbers.remove(number.toInt());
//                             } else {
//                               selectedNumbers.add(number.toInt());
//                             }
//                           });
//                         },
//                         child: Container(
//                           width: 52,
//                           height: 52,
//                           padding: EdgeInsets.all(8.0),
//                           decoration: BoxDecoration(
//                             color: isSelected ? Color(0xffFFAAA2) : Colors.transparent,
//                             border: Border.all(
//                               width: 1,
//                               color: Color(0xffB8B8B8),
//                             ),
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           child: Center(
//                             child: Text(
//                               number.toString(),
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Color(0xffB8B8B8),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ).toList(),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
