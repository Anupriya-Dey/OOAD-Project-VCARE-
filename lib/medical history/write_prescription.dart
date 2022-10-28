import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class write_prescription extends StatefulWidget {
  const write_prescription({super.key});

  @override
  State<write_prescription> createState() => _write_prescriptionState();
}

class _write_prescriptionState extends State<write_prescription> {
  @override
  Widget build(BuildContext context) {
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
          ListTile(
            title: Text("doc name"),
          ),
          Divider(),
          ListTile(
            title: Text("date"),
          ),
          Divider(),
          Container(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: '    write prescription',
              ),
            ),
          )
        ]));
  }
}
