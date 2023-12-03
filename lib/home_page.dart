import 'dart:convert';

import 'package:doctor_appointment_app_56/constant/colors.dart';
import 'package:doctor_appointment_app_56/doctor_part.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'constant/model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   List<DoctorList> doctorLists = [];
    void showSimpleDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          double baseWidth = 1120;
          double fem = MediaQuery.of(context).size.width / baseWidth;
          double ffem = fem * 0.97;
          return AlertDialog(
            content: Container(
              width: 500 * fem,
              child: Material(
                child: ListView.builder(
                  itemCount: doctorLists.length,
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: EdgeInsets.all(8.0),
                    title: Text(
                      doctorLists[index].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      doctorLists[index].experience,
                      style: TextStyle(color: Colors.black.withOpacity(0.7)),
                    ),
             
                  ),
                ),
              ),
            ),
          );
        },
      );
  List catNames = [
    "Dental",
    "Heart",
    "Eye",
    "Brain",
    "Ear",
  ];

  List<Icon> catIcon = [
    Icon(
      MdiIcons.toothOutline,
      color: pcolor,
      size: 30,
    ),
    Icon(
      MdiIcons.heartPlus,
      color: pcolor,
      size: 30,
    ),
    Icon(
      MdiIcons.eye,
      color: pcolor,
      size: 30,
    ),
    Icon(
      MdiIcons.brain,
      color: pcolor,
      size: 30,
    ),
    Icon(
      MdiIcons.earHearing,
      color: pcolor,
      size: 30,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFD9E4EE),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    pcolor.withOpacity(0.8),
                    pcolor,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  "https://media.istockphoto.com/id/1530248128/photo/portrait-of-cheerful-female-doctor-with-digital-tablet-beside-window-in-corridor.webp?b=1&s=170667a&w=0&k=20&c=lr9kQSJFSMXao-_XHEyTjca6fhzdoIg9lDdOL8j-kHE="),
                            ),
                            Icon(
                              Icons.notifications_outlined,
                              color: wcolor,
                              size: 30,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Hi Patient",
                          style: TextStyle(
                              color: wcolor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Your health is our\n First priority",
                          style: TextStyle(
                            color: wcolor,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15, bottom: 20),
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: wcolor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: sdColor,
                                  blurRadius: 6,
                                  spreadRadius: 3,
                                )
                              ]),
                          child: TextFormField(
                              onChanged: (value) async {
     
      await getData();
  
      showSimpleDialog(context);
    },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: " Search here ",
                                hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 25,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: bcolor.withOpacity(0.7),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: catNames.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              height: 55,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF2F8FF),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: sdColor,
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    )
                                  ]),
                              child: Center(
                                child: catIcon[index],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              catNames[index],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: bcolor.withOpacity(0.7),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30,),
                  Padding(padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "Doctors recommended for you",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: bcolor.withOpacity(0.7),
                    ),
                  ),
                  ),
                  DoctorPart(),
                ],
              ),
            )
          ],
        ),
      ),
    );
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
