// import 'dart:math';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter/widgets.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'patient_profile.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// class AppointmentWithoutWeekends extends StatefulWidget {
//   const AppointmentWithoutWeekends({super.key});
//
//   @override
//   CalendarAppointment createState() => CalendarAppointment();
// }
//
// class Patient {
//   String name;
//   String phno;
//   Image prfl = Image.asset("assets/images/imgdefault.png");
//   Patient.constructor1(this.name, this.phno, this.prfl);
//   Patient.constructor2(this.name, this.phno);
// }
//
// class Doctor {
//   String name;
//   String phno;
//   String Specialisation;
//   Image prfl = Image.asset("assets/images/imgdefault.png");
//   List<appointmentDetails> requestlist = <appointmentDetails>[];
//   List<appointmentDetails> MyAppointments = <appointmentDetails>[];
//   Doctor.constructor1(this.name, this.phno, this.Specialisation, this.prfl);
//   Doctor.constructor2(this.name, this.phno, this.Specialisation);
//
//   void addrequest(appointmentDetails req) {
//     requestlist.add(req);
//   }
//
//   void declineRequest(appointmentDetails req) {
//     requestlist.remove(req);
//   }
//
//   void acceptRequest(appointmentDetails req) {
//     MyAppointments.add(req);
//     requestlist.remove(req);
//   }
//
//   void addAppointment(appointmentDetails apd) {
//     MyAppointments.add(apd);
//   }
// }
//
// class appointmentDetails {
//   bool accepted = false;
//   Patient patient;
//   DateTime startTime;
//   DateTime endTime;
//   appointmentDetails.constructor(this.patient, this.startTime, this.endTime);
//   void acceptRequest() {
//     accepted = true;
//   }
// }
//
// class CalendarAppointment extends State<AppointmentWithoutWeekends> {
//   final CalendarDataSource _dataSource = _DataSource(<Appointment>[]);
//   final List<Color> _colorCollection = <Color>[];
//   List<TimeRegion> _specialTimeRegion = <TimeRegion>[];
//   final CalendarController _calendarController = CalendarController();
//
//   Doctor doc1 = Doctor.constructor2("Komal Gupta", "8765435688", "Pychiatrist");
//   @override
//   void initState() {
//     _getPatientCollection(doc1);
//     _getColorCollection();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: const Text("Appointment Schedule"),
//         // Theme.of(context).scaffoldBackgroundColor,
//         elevation: 3,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back,
//               color: Color.fromARGB(255, 255, 255, 255)),
//           onPressed: () => Navigator.of(
//             context,
//             rootNavigator: true,
//           ).pop(
//             context,
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: SfCalendar(
//           dataSource: _dataSource,
//           view: CalendarView.week,
//           allowedViews: const [
//             CalendarView.day,
//             CalendarView.week,
//             CalendarView.month,
//           ],
//           onViewChanged: viewChanged,
//           specialRegions: _specialTimeRegion,
//         ),
//       ),
//     );
//   }
//
//   void viewChanged(ViewChangedDetails viewChangedDetails) {
//     List<DateTime> visibleDates = viewChangedDetails.visibleDates;
//     List<TimeRegion> timeRegion = <TimeRegion>[];
//     List<Appointment> appointments = <Appointment>[];
//     _dataSource.appointments!.clear();
//
//     for (int i = 0; i < visibleDates.length; i++) {
//       if (visibleDates[i].weekday == 6 || visibleDates[i].weekday == 7) {
//         continue;
//       }
//       timeRegion.add(
//         TimeRegion(
//             startTime: DateTime(visibleDates[i].year, visibleDates[i].month,
//                 visibleDates[i].day, 13, 0, 0),
//             endTime: DateTime(visibleDates[i].year, visibleDates[i].month,
//                 visibleDates[i].day, 14, 0, 0),
//             text: 'Break',
//             enablePointerInteraction: true),
//       );
//
//       SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
//         setState(() {
//           _specialTimeRegion = timeRegion;
//         });
//       });
//     }
//     for (int i = 0; i < doc1.MyAppointments.length; i++) {
//       DateTime endTime = doc1.MyAppointments[i].endTime;
//       bool doGrey = ((endTime.year < DateTime.now().year) ||
//           (endTime.year == DateTime.now().year &&
//               endTime.month < DateTime.now().month) ||
//           (endTime.year == DateTime.now().year &&
//               endTime.month == DateTime.now().month &&
//               endTime.day < DateTime.now().day) ||
//           (endTime.year == DateTime.now().year &&
//               endTime.month == DateTime.now().month &&
//               endTime.day == DateTime.now().day &&
//               endTime.hour < DateTime.now().hour) ||
//           ((endTime.year == DateTime.now().year &&
//               endTime.month == DateTime.now().month &&
//               endTime.day == DateTime.now().day &&
//               endTime.hour == DateTime.now().hour &&
//               endTime.minute < DateTime.now().minute)));
//       Random random = Random();
//       appointments.add(Appointment(
//           startTime: doc1.MyAppointments[i].startTime,
//           endTime: doc1.MyAppointments[i].endTime,
//           subject: doc1.MyAppointments[i].patient.name,
//           color: (doGrey)
//               ? (Colors.grey)
//               : (_colorCollection[random.nextInt(9)])));
//     }
//     for (int i = 0; i < appointments.length; i++) {
//       _dataSource.appointments!.add(appointments[i]);
//     }
//     _dataSource.notifyListeners(
//         CalendarDataSourceAction.reset, _dataSource.appointments!);
//   }
//
//   void _getPatientCollection(Doctor doc) {
//     Patient p1 = Patient.constructor2("Mehak Sharma", "9876543256");
//     doc.addAppointment(appointmentDetails.constructor(
//         p1, DateTime(2022, 11, 8, 9, 0, 0), DateTime(2022, 11, 8, 10, 0, 0)));
//     Patient p0 = (Patient.constructor2("Neha Gujar", "9876543467"));
//     doc.addAppointment(appointmentDetails.constructor(
//         p0, DateTime(2022, 11, 8, 11, 0, 0), DateTime(2022, 11, 8, 12, 0, 0)));
//     Patient p2 = Patient.constructor2("Manashree Kalode", "9567898954");
//     doc.addAppointment(appointmentDetails.constructor(
//         p2, DateTime(2022, 11, 8, 17, 0, 0), DateTime(2022, 11, 8, 18, 0, 0)));
//     Patient p3 = (Patient.constructor2("Nishita Sigh", "9565766356"));
//     doc.addAppointment(appointmentDetails.constructor(
//         p3, DateTime(2022, 11, 9, 10, 0, 0), DateTime(2022, 11, 9, 11, 0, 0)));
//     Patient p4 = (Patient.constructor2("Kashish Prakash", "9876545677"));
//     doc.addAppointment(appointmentDetails.constructor(
//         p4, DateTime(2022, 11, 9, 14, 0, 0), DateTime(2022, 11, 9, 15, 0, 0)));
//     Patient p5 = (Patient.constructor2("Akansha Swati", "9899765446"));
//     doc.addAppointment(appointmentDetails.constructor(p5,
//         DateTime(2022, 11, 10, 10, 0, 0), DateTime(2022, 11, 10, 11, 0, 0)));
//     Patient p6 = (Patient.constructor2("Aarya Aggarwal", "8897553256"));
//     doc.addAppointment(appointmentDetails.constructor(p6,
//         DateTime(2022, 11, 10, 11, 0, 0), DateTime(2022, 11, 10, 12, 0, 0)));
//     Patient p7 = (Patient.constructor2("Shinjan Chaturvedi", "7875443256"));
//     doc.addAppointment(appointmentDetails.constructor(
//         p7, DateTime(2022, 11, 12, 9, 0, 0), DateTime(2022, 11, 12, 10, 0, 0)));
//     Patient p8 = (Patient.constructor2("Shreya Shivkumar", "9777273356"));
//     doc.addAppointment(appointmentDetails.constructor(p8,
//         DateTime(2022, 11, 11, 12, 0, 0), DateTime(2022, 11, 11, 13, 0, 0)));
//     Patient p9 = (Patient.constructor2("Prerna Chandolia", "9876543256"));
//     doc.addAppointment(appointmentDetails.constructor(p9,
//         DateTime(2022, 11, 11, 10, 0, 0), DateTime(2022, 11, 11, 11, 0, 0)));
//     for (int i = 0; i < doc.MyAppointments.length; i++) {
//       doc.MyAppointments[i].acceptRequest();
//     }
//   }
//
//   void _getColorCollection() {
//     _colorCollection.add(const Color(0xFF0F8644));
//     _colorCollection.add(const Color(0xFF8B1FA9));
//     _colorCollection.add(const Color(0xFFD20100));
//     _colorCollection.add(const Color(0xFFFC571D));
//     _colorCollection.add(const Color(0xFF36B37B));
//     _colorCollection.add(const Color(0xFF01A1EF));
//     _colorCollection.add(const Color(0xFF3D4FB5));
//     _colorCollection.add(const Color(0xFFE47C73));
//     _colorCollection.add(const Color(0xFF636363));
//     _colorCollection.add(const Color(0xFF0A8043));
//   }
// }
//
// class _DataSource extends CalendarDataSource {
//   _DataSource(List<Appointment> source) {
//     appointments = source;
//   }
// }
