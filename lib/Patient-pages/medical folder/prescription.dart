// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
//
// import '../book appointment/search_by_name.dart';
//
// class prescription extends StatefulWidget {
//   const prescription({super.key});
//
//   @override
//   State<prescription> createState() => _prescriptionState();
// }
//
// // class prescriptionText {
// //   Doctor doc;
// //   Text prestn;
// //   prescriptionText.constructor1(this.doc, this.prestn);
// // }
//
// class _prescriptionState extends State<prescription> {
//   // List<prescriptionText> pres = [
//   //   prescriptionText.constructor1(
//   //       Doctor.constructor2("Dr Shalini veda", "234567", "psychiatrist"),
//   //       Text("Cugh Syrup before lunch/dinner")),
//   //   prescriptionText.constructor1(
//   //       Doctor.constructor2("Dr Shalini veda", "234567", "psychiatrist"),
//   //       Text("Paracatemol after breakfast/lunch/dinner")),
//   //   prescriptionText.constructor1(
//   //       Doctor.constructor2("Dr Vedik gosh", "2345622", "General practitioner"),
//   //       Text("eat apple every day"))
//   // ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         padding: const EdgeInsets.only(top: 10),
//         itemCount: (pres.length) * 2,
//         itemBuilder: (context, i) {
//           if (i.isOdd) return const Divider();
//           final j = i ~/ 2;
//           return ListTile(
//             title: Text(pres[j].doc.name),
//             subtitle: pres[j].prestn,
//           );
//         },
//       ),
//     );
//   }
// }
