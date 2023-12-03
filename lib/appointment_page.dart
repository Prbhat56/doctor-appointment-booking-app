import 'package:doctor_appointment_app_56/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'constant/model.dart';

class AppointmentPage extends StatefulWidget {
  final DoctorList doctor;
  const AppointmentPage({Key? key, required this.doctor}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
    bool isBooked = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFD9E4EE),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2.1,
              decoration:  BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.doctor.imageUrl),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    pcolor.withOpacity(0.9),
                    pcolor.withOpacity(0),
                    pcolor.withOpacity(0),

                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                              Navigator.pop(context);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF2F8FF),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                const BoxShadow(
                                  color: sdColor,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                )
                              ]
                            ),
                            child: const Center(
                              child: Icon(Icons.arrow_back,
                              color: pcolor,size: 28,),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8),
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F8FF),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              const BoxShadow(
                                color: sdColor,
                                blurRadius: 4,
                                spreadRadius: 2,
                              )
                            ]
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.favorite_outline,
                              color: pcolor,
                              size: 28,
                            ),
                          ),
                        )
                      ],
                    ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                         Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Patient",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: wcolor,
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              widget.doctor.totalcheckup,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: wcolor,
                              ),
                            )
                          ],
                         ),
                          Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Experience",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: wcolor,
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              widget.doctor.experience,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: wcolor,
                              ),
                            )
                          ],
                         ),
                          Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Rating",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: wcolor,
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              widget.doctor.rating,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: wcolor,
                              ),
                            )
                          ],
                         )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.doctor.name,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: pcolor,
                  ),
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Icon(MdiIcons.heartPlus,color: Colors.red,size:28,),
                    SizedBox(width: 5,),
                    Text(widget.doctor.speciality,
                    style: TextStyle(
                      fontSize: 17,
                      color: bcolor.withOpacity(0.6),
                    ),)
                  ],
                ),
                SizedBox(height: 15,),
                Text(
                 widget.doctor.description,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.6),

                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 15,),
              ],
            ),
            ),
            SizedBox(height: 30,),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isBooked = true;
                      });
             
                    },
                    style: ElevatedButton.styleFrom(
                      primary: isBooked ? Colors.green : pcolor,
                    ),
                    child: Text(
                      isBooked ? 'Booked' : 'Book Now',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}