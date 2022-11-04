import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ooadproject/Patient-pages/home_screen_patient.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class FlutterDatePickerExample extends StatelessWidget {
  final ValueNotifier<DateTime?> dateSub = ValueNotifier(null);
  final ValueNotifier<DateTime?> longDateSub = ValueNotifier(null);
  final ValueNotifier<TimeOfDay?> timeSub = ValueNotifier(null);
  final ValueNotifier<TimeOfDay?> timeSubShort = ValueNotifier(null);
  final TextEditingController meetingName = TextEditingController();
  final TextEditingController meetingLink = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Dr Komal Gupta",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              const TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: '    Enter description of the problem',
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              const Text(
                ' Appointment Date',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18.0),
              ),
              ValueListenableBuilder<DateTime?>(
                  valueListenable: longDateSub,
                  builder: (context, dateVal, child) {
                    return InkWell(
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2050),
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context),
                                  child: child!,
                                );
                              });
                          longDateSub.value = date;
                        },
                        child: buildDateTimePicker(
                            dateVal != null ? longDate(dateVal) : ''));
                  }),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Enter Time',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18.0),
              ),
              ValueListenableBuilder<TimeOfDay?>(
                  valueListenable: timeSub,
                  builder: (context, timeVal, child) {
                    return InkWell(
                        onTap: () async {
                          TimeOfDay? time = await showTimePicker(
                            context: context,
                            builder: (context, child) {
                              return MediaQuery(
                                data: MediaQuery.of(context)
                                    .copyWith(alwaysUse24HourFormat: true),
                                child: child!,
                              );
                            },
                            initialTime: TimeOfDay.now(),
                          );
                          timeSub.value = time;
                        },
                        child: buildDateTimePicker(
                            timeVal != null ? timeVal.format(context) : ''));
                  }),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Material(
        color: Color.fromARGB(255, 71, 113, 253),
        child: InkWell(
          onTap: () {
            if (longDateSub.value != null) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Request sent'),
                duration: Duration(seconds: 5),
              ));

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen1()));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Fill all the details'),
                duration: Duration(seconds: 3),
              ));
            }
          },
          child: const SizedBox(
            height: kToolbarHeight,
            width: double.infinity,
            child: Center(
              child: Text(
                'Submit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String convertDate(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  String longDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, yyy').format(dateTime);
  }

  String convertTime(TimeOfDay timeOfDay) {
    DateTime tempDate = DateFormat('hh:mm')
        .parse(timeOfDay.hour.toString() + ':' + timeOfDay.minute.toString());
    var dateFormat = DateFormat('h:mm a');
    return dateFormat.format(tempDate);
  }

  Widget buildDateTimePicker(String data) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(color: AppColors.eggPlant, width: 1.5),
      ),
      title: Text(data),
      trailing: const Icon(
        Icons.calendar_today,
        color: AppColors.eggPlant,
      ),
    );
  }

  Widget buildTextField(
      {String? hint, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: hint ?? '',
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.eggPlant, width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.eggPlant, width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      ),
    );
  }
}

class AppColors {
  AppColors._();

  static const Color blackCoffee = Color(0xFF352d39);
  static const Color eggPlant = Color(0xFF6d435a);
  static const Color celeste = Color(0xFFb1ede8);
  static const Color babyPowder = Color(0xFFFFFcF9);
  static const Color ultraRed = Color(0xFFFF6978);
}
