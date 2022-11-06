import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:ooadproject/main.dart';

class write_prescription extends StatefulWidget {
  write_prescription({super.key, required this.patient});
  Patient patient;
  @override
  State<write_prescription> createState() => _write_prescriptionState();
}

class _write_prescriptionState extends State<write_prescription> {
  String pres = "";
  @override
  Widget build(BuildContext context) {
    Patient patient = widget.patient;
    return Scaffold(
      appBar: AppBar(
        title: Text("write new prescription"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(children: [
        // const ListTile(
        //   title: Text("doc name"),
        // ),
        // const Divider(),
        ListTile(
          title: Text(DateFormat('MMMM dd, yyyy').format(DateTime.now())),
        ),
        Divider(),
        Container(
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: (value) => pres = value,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: '    write prescription',
            ),
          ),
        )
      ]),
      bottomNavigationBar: Material(
        color: Color.fromARGB(255, 71, 113, 253),
        child: InkWell(
          onTap: () {
            patient.addPrescription(pres);
            Navigator.of(context).pop();
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
}
