import 'package:doctor_appointment_app_56/constant/colors.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 1600,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            pcolor.withOpacity(0.8),
            pcolor,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.network(
                    'https://images.unsplash.com/photo-1631217868264-e5b90bb7e133?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzV8fGRvY3RvcnxlbnwwfHwwfHx8MA%3D%3D'),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Doctors Available Here',
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  letterSpacing: 1,
                  wordSpacing: 2,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Book Your Doctor",
                style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 60,
              ),
              Material(
                color: wcolor,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    child: const Text(
                      "Let's Go",
                      style: TextStyle(
                          color: pcolor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
