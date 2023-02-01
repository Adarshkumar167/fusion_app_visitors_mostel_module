import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fusion_app_visitors_mostel_module/screens/datepick.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class landing extends StatefulWidget {
  const landing({super.key});

  @override
  State<landing> createState() => _landingState();
}

// ignore: camel_case_types
class _landingState extends State<landing> {
  TextEditingController controller = TextEditingController();
  List items = ['A', 'B', 'C', 'D'];
  // ignore: prefer_typing_uninitialized_variables
  var valueChose;
  var count = 0;
  var count2 = 0;
  @override
  void initState() {
    setState(() {
      controller.text = "${DateTime.now().hour}: ${DateTime.now().minute} ";
    });
    super.initState();
  }

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
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Place a request",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 16),
                        const Text("Booking Details",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        const Text("Arrival Date"),
                        const SizedBox(height: 8),
                        SizedBox(
                            height: 32,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const DatePicker()),
                        const SizedBox(height: 16),
                        const Text("Departure Date"),
                        const SizedBox(height: 8),
                        SizedBox(
                            height: 32,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const DatePicker()),
                        const SizedBox(height: 16),
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
                        const SizedBox(height: 16),
                        const Text(
                          "Number of People",
                        ),
                        const SizedBox(height: 8),
                        Container(
                          alignment: Alignment.center,
                          height: 32,
                          width: 94,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (count > 0) {
                                      count--;
                                    }
                                  });
                                },
                                child: Container(
                                    width: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.3),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        border: Border.all(
                                            color: Colors.black, width: 1)),
                                    child: const Icon(
                                      Icons.remove,
                                      size: 20,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(count.toString()),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                                child: Container(
                                    width: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.3),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        border: Border.all(
                                            color: Colors.black, width: 1)),
                                    child: const Icon(
                                      Icons.add,
                                      size: 20,
                                    )),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Remarks",
                        ),
                        const SizedBox(height: 8),
                        const TextField(
                          maxLines: 5,
                        )
                      ],
                    ),
                  ),
                ),
                side()
              ],
            )));
  }

  Widget side() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 90),
            const Text("Arrival Time"),
            TextField(
              controller: controller, //editing controller of this TextField
              decoration: const InputDecoration(
                  icon: Icon(Icons.timer), //icon of text field
                  labelText: "Enter Time" //label text of field
                  ),
              readOnly:
                  true, //set it true, so that user will not able to edit text
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );

                if (pickedTime != null) {
                  //output 10:51 PM
                  DateTime parsedTime = DateFormat.jm()
                      // ignore: use_build_context_synchronously
                      .parse(pickedTime.format(context).toString());
                  //converting to DateTime so that we can further format on different pattern.
                  //output 1970-01-01 22:53:00.000
                  String formattedTime = DateFormat('HH:mm').format(parsedTime);
                  //output 14:59:00
                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                  setState(() {
                    controller.text =
                        formattedTime; //set the value of text field.
                  });
                } else {}
              },
            ),
            const SizedBox(height: 16),
            const Text("Departure Time"),
            TextField(
              controller: controller, //editing controller of this TextField
              decoration: const InputDecoration(
                  icon: Icon(Icons.timer), //icon of text field
                  labelText: "Enter Time" //label text of field
                  ),
              readOnly:
                  true, //set it true, so that user will not able to edit text
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );

                if (pickedTime != null) {
                  //output 10:51 PM
                  DateTime parsedTime = DateFormat.jm()
                      // ignore: use_build_context_synchronously
                      .parse(pickedTime.format(context).toString());
                  //converting to DateTime so that we can further format on different pattern.
                  //output 1970-01-01 22:53:00.000
                  String formattedTime = DateFormat('HH:mm').format(parsedTime);
                  //output 14:59:00
                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                  setState(() {
                    controller.text =
                        formattedTime; //set the value of text field.
                  });
                } else {}
              },
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            const Text(
              "Number of Rooms",
            ),
            const SizedBox(height: 8),
            Container(
              alignment: Alignment.center,
              height: 32,
              width: 94,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (count2 > 0) {
                          count2--;
                        }
                      });
                    },
                    child: Container(
                        width: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.black, width: 1)),
                        child: const Icon(
                          Icons.remove,
                          size: 20,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(count2.toString()),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        count2++;
                      });
                    },
                    child: Container(
                        width: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.black, width: 1)),
                        child: const Icon(
                          Icons.add,
                          size: 20,
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Purpose of Visit",
            ),
            const TextField(),
            const SizedBox(height: 80),
            TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Colors.blue.withOpacity(0.10);
                      }
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed)) {
                        return Colors.blue.withOpacity(0.40);
                      }
                      return null; // Defer to the widget's default.
                    },
                  ),
                ),
                onPressed: () {},
                child: const Text('Next'))
          ],
        ),
      ),
    );
  }
}
