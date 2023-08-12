import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isOneWay = true;
  String tabTitle = "Sedan";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width,
                height: 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/map.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 20.0, right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.green,
                            size: 40.0,
                          ),
                          const SizedBox(height: 5.0),
                          Container(
                            width: 2.0,
                            height: 8.0,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 5.0),
                          Container(
                            width: 2.0,
                            height: 8.0,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 5.0),
                          Container(
                            width: 2.0,
                            height: 8.0,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 5.0),
                          Container(
                            width: 2.0,
                            height: 3.0,
                            color: Colors.grey,
                          ),
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.red,
                            size: 40.0,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Source Location",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            "Bangalore,Karnataka,India",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            color: Colors.grey,
                            height: 2.0,
                            width: Get.width - 100,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            "Destination Location",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            "Mysuru,Karnataka,India",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    const Expanded(
                        child: Text(
                      "Top Suggestion for you",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                    Expanded(
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Pickup Date Time",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5.0),
                            DateTimeFormField(
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.black45),
                                errorStyle: TextStyle(color: Colors.redAccent),
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.event_note),
                              ),
                              mode: DateTimeFieldPickerMode.dateAndTime,
                              autovalidateMode: AutovalidateMode.always,
                              validator: (e) => (e?.day ?? 0) == 1
                                  ? 'Please not the first day'
                                  : null,
                              onDateSelected: (DateTime value) {
                                debugPrint(value.toString());
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      if (tabTitle == 'Sedan')
                        const BoxShadow(
                          color: Colors.grey,
                          blurRadius: 9.0,
                          spreadRadius: 1.0,
                          offset: Offset(
                            1.0, // Move to right 5  horizontally
                            1.0, // Move to bottom 5 Vertically
                          ),
                        )
                    ],
                    border: tabTitle == 'Sedan' ? Border.all() : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        tabTitle = 'Sedan';
                      });
                    },
                    leading: Image.asset(
                      'assets/images/car_icon.png',
                      width: 70,
                    ),
                    title: const Text(
                      "Sedan",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      "Maruti Swift Dzire Or Similar",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: SizedBox(
                        child: Column(
                      children: const [
                        Text(
                          "₹ 3729",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 53, 156, 106)),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Icon(
                          Icons.info_outline_rounded,
                          size: 30.0,
                          color: Colors.black,
                        )
                      ],
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      if (tabTitle == 'Suv')
                        const BoxShadow(
                          color: Colors.grey,
                          blurRadius: 9.0,
                          spreadRadius: 1.0,
                          offset: Offset(
                            1.0, // Move to right 5  horizontally
                            1.0, // Move to bottom 5 Vertically
                          ),
                        )
                    ],
                    border: tabTitle == 'Suv' ? Border.all() : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        tabTitle = 'Suv';
                      });
                    },
                    leading: Image.asset(
                      'assets/images/car_icon.png',
                      width: 70,
                    ),
                    title: const Text(
                      "SUV",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      "Toyota Innova 6+1 Os Similar",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: SizedBox(
                        child: Column(
                      children: const [
                        Text(
                          "₹ 5832",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 53, 156, 106)),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Icon(
                          Icons.info_outline_rounded,
                          size: 30.0,
                          color: Colors.black,
                        )
                      ],
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      if (tabTitle == 'Crysta')
                        const BoxShadow(
                          color: Colors.grey,
                          blurRadius: 9.0,
                          spreadRadius: 1.0,
                          offset: Offset(
                            1.0, // Move to right 5  horizontally
                            1.0, // Move to bottom 5 Vertically
                          ),
                        )
                    ],
                    border: tabTitle == 'Crysta' ? Border.all() : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        tabTitle = 'Crysta';
                      });
                    },
                    leading: Image.asset(
                      'assets/images/car_icon.png',
                      width: 70,
                    ),
                    title: const Text(
                      "Crysta",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      "Toyota Innova 6+1 Or Similar",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: SizedBox(
                        child: Column(
                      children: const [
                        Text(
                          "₹ 8068",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 53, 156, 106)),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Icon(
                          Icons.info_outline_rounded,
                          size: 30.0,
                          color: Colors.black,
                        )
                      ],
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        isOneWay = true;
                      }),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: !isOneWay ? Border.all() : null,
                            color: isOneWay
                                ? const Color.fromARGB(255, 226, 217, 217)
                                : Colors.white),
                        child: Row(
                          children: [
                            if (isOneWay) const Icon(Icons.check),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Book for mySelf",
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: isOneWay ? Border.all() : null,
                            color: !isOneWay
                                ? const Color.fromARGB(255, 226, 217, 217)
                                : Colors.white),
                        child: Row(
                          children: [
                            if (!isOneWay) const Icon(Icons.check),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Book for others",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                width: Get.width - 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: Colors.black),
                  onPressed: () {},
                  child: const Text(
                    'Book',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
