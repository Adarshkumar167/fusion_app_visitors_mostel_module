import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fusion_app_visitors_mostel_module/screens/datepick.dart';

// ignore: camel_case_types
class landing extends StatefulWidget {
  const landing({super.key});

  @override
  State<landing> createState() => _landingState();
}

// ignore: camel_case_types
class _landingState extends State<landing> {
  List items = ['A', 'B', 'C', 'D'];
  // ignore: prefer_typing_uninitialized_variables
  var valueChose;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                Column(
                  children: const [
                    Text("Visitor Hostel"),
                    Icon(Icons.bed_sharp),
                  ],
                ),
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Text("P"),
                )
              ],
            )),
        body: Container(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
                minWidth: MediaQuery.of(context).size.width),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Place a request",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                  const Text("Booking Details",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  const Text("Arrival Date"),
                  const SizedBox(height: 50, child: DatePicker()),
                  const Text("Departure Date"),
                  const SizedBox(height: 50, child: DatePicker()),
                  const Text(
                    "Category",
                  ),
                  DropdownButton2(
                    hint: const Text("Select Catagory"),
                    focusColor: Colors.white,
                    icon: const Icon(Icons.arrow_drop_down),
                    value: valueChose,
                    onChanged: (newValue) {
                      setState(() {
                        valueChose = newValue;
                      });
                    },
                    items: items.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ],
              ),
            )));
  }
}
