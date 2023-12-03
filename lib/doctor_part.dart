import 'dart:convert';

import 'package:doctor_appointment_app_56/appointment_page.dart';
import 'package:doctor_appointment_app_56/constant/colors.dart';
import 'package:doctor_appointment_app_56/constant/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DoctorPart extends StatefulWidget {
  const DoctorPart({super.key});

  @override
  State<DoctorPart> createState() => _DoctorPartState();
}

class _DoctorPartState extends State<DoctorPart> {
  List<DoctorList> doctorLists = [];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 340,
        child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: doctorLists.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 300,
                          width: 200,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          decoration: BoxDecoration(
                              color: const Color(0xFFF2F8FF),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                const BoxShadow(
                                  color: sdColor,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                )
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                   AppointmentPage(doctor: doctorLists[index])));
                                    },
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      child: Image.network(
                                        doctorLists[index].imageUrl,
                                        height: 200,
                                        width: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      margin: const EdgeInsets.all(8),
                                      height: 45,
                                      width: 45,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFFF2F8FF),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: sdColor,
                                              blurRadius: 4,
                                              spreadRadius: 2,
                                            )
                                          ]),
                                      child: const Center(
                                        child: Icon(
                                          Icons.favorite_outline,
                                          color: pcolor,
                                          size: 28,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      doctorLists[index].name,
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: pcolor,
                                      ),
                                    ),
                                    Text(
                                      doctorLists[index].speciality,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: bcolor.withOpacity(0.6),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          doctorLists[index].rating,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: bcolor.withOpacity(0.6),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  Future<List<DoctorList>> getData() async {
    final response =
        await http.get(Uri.parse("http://localhost:5000/doctorlist"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        doctorLists.add(DoctorList.fromJson(index));
      }
      return doctorLists;
    } else {
      return doctorLists;
    }
  }
}
