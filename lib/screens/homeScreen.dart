import 'package:cabto/screens/details_Screen.dart';
import 'package:cabto/screens/widget/citycab.dart';
import 'package:cabto/screens/widget/outstation.dart';
import 'package:cabto/screens/widget/rental.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  bool isReturn = false;
  void returnTrip(bool value) {
    setState(() {
      isReturn = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.yellow,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text("CABTO",
              style: GoogleFonts.alumniSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          centerTitle: true),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/map.png'),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
                child: TextFormField(
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                    filled: true,
                    fillColor: Colors.white,
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                    border: InputBorder.none,
                    hintText: "Search Location",
                    hintStyle:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            DefaultTabController(
                length: 3,
                child: TabBar(
                  onTap: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  labelColor: Colors.black,
                  tabs: const [
                    Tab(icon: Icon(Icons.local_taxi), text: "City Cab"),
                    Tab(icon: Icon(Icons.car_rental), text: "Rental"),
                    Tab(
                        icon: Icon(Icons.transfer_within_a_station),
                        text: "Outstation"),
                  ],
                )),
            const Divider(),
            if (index == 0) const CityCab(),
            if (index == 1) const Rental(),
            if (index == 2) const Outstation(),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: Get.width - 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    backgroundColor: Colors.black),
                onPressed: () {
                  if (index == 1) {
                    Get.to(() => const DetailsScreen());
                  }
                  debugPrint(index.toString());
                },
                child: const Text('Next'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
