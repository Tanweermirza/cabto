import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Outstation extends StatefulWidget {
  const Outstation({
    super.key,
  });

  @override
  State<Outstation> createState() => _OutstationState();
}

class _OutstationState extends State<Outstation> {
  bool isOneWay = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Card(
            elevation: 5.0,
            shadowColor: Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(.1),
                        labelText: 'Destination',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() {
                          isOneWay = true;
                        }),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: !isOneWay ? Border.all() : null,
                              color: isOneWay
                                  ? Color.fromARGB(255, 226, 217, 217)
                                  : Colors.white),
                          child: Row(
                            children: [
                              if (isOneWay) Icon(Icons.check),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "One-way",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      GestureDetector(
                        onTap: () => setState(() {
                          isOneWay = false;
                        }),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: isOneWay ? Border.all() : null,
                              color: !isOneWay
                                  ? Color.fromARGB(255, 226, 217, 217)
                                  : Colors.white),
                          child: Row(
                            children: [
                              if (!isOneWay) Icon(Icons.check),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Round-Trip",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  if (isOneWay == false)
                    DateTimeFormField(
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.event_note),
                        hintText: 'Return Date',
                      ),
                      mode: DateTimeFieldPickerMode.dateAndTime,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (e) => (e?.day ?? 0) == 1
                          ? 'Please not the first day'
                          : null,
                      onDateSelected: (DateTime value) {
                        print(value);
                      },
                    )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
