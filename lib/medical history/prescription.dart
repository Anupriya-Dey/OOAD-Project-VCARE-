import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'write_prescription.dart';

class prescription extends StatefulWidget {
  const prescription({super.key});

  @override
  State<prescription> createState() => _prescriptionState();
}

class _prescriptionState extends State<prescription> {
  List<Text> pres = [Text("HI"), Text("hello")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: (pres.length) * 2,
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();
          final j = i ~/ 2;
          return pres[j];
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const write_prescription()),
            );
          },
          child: Icon(Icons.add)),
    );
  }
}
