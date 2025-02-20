import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Setschedule extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final List<String> Grade;
  // ignore: non_constant_identifier_names
  const Setschedule({
    required this.Grade,
    super.key,
  });

  @override
  State<Setschedule> createState() => _SetscheduleState();
}

class _SetscheduleState extends State<Setschedule> {
  // ignore: non_constant_identifier_names
  List<String> Day = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 2, 3, 87),
              const Color.fromARGB(255, 18, 52, 126)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 2, 1, 95),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage("assets/images/AppLogo.png"),
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    "SET SCHEDULE TIME",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.Grade.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildGrades(
                        widget.Grade[index],
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget buildGrades(String Grade) {
    final _formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    contentPadding: EdgeInsets.all(20),
                    backgroundColor: Color.fromARGB(255, 2, 1, 95),
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    contentTextStyle: GoogleFonts.poppins(color: Colors.white),
                    title: Text("Set Time"),
                    content: SizedBox(
                      height: 270,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Text(
                              "Grade :  $Grade",
                              style: GoogleFonts.poppins(),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Select Day ",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                    child: DropdownButtonFormField(
                                      validator: (value) {
                                        if (_dayController.text.isEmpty) {
                                          return 'Please select day';
                                        }
                                        return null;
                                      },
                                      items: Day.map((e) => DropdownMenuItem(
                                          value: e, child: Text(e))).toList(),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: const Color.fromARGB(
                                                255, 141, 141, 141),
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 174, 174, 174),
                                      ),
                                      onChanged: (value) {
                                        _dayController.text = value.toString();
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text("Start"),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: TextFormField(
                                      validator: (value) {
                                        if (_startTimeController
                                            .text.isEmpty) {
                                          return "Please select start time";
                                        }
                                        return null;
                                      },
                                      controller: _startTimeController,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: const Color.fromARGB(
                                                255, 221, 221, 221),
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 174, 174, 174),
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.timer,
                                              size: 30, color: Colors.black),
                                          onPressed: () async {
                                            TimeOfDay? pickedTime =
                                                await showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now(),
                                            );
                                            MaterialLocalizations
                                                localizations =
                                                MaterialLocalizations.of(
                                                    // ignore: use_build_context_synchronously
                                                    context);
                                            String formattedTime =
                                                localizations.formatTimeOfDay(
                                                    pickedTime!,
                                                    alwaysUse24HourFormat:
                                                        false);
                                  
                                            setState(() {
                                              _startTimeController.text =
                                                  formattedTime;
                                            });
                                          },
                                        ),
                                      ),
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text("End"),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: TextFormField(
                                      validator: (value) {
                                        if (_endTimeController.text.isEmpty) {
                                          return "Please select end time";
                                        }
                                        return null;
                                      },
                                      controller: _endTimeController,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: const Color.fromARGB(
                                                255, 221, 221, 221),
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 174, 174, 174),
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.timer,
                                              size: 30, color: Colors.black),
                                          onPressed: () async {
                                            TimeOfDay? pickedTime =
                                                await showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now(),
                                            );
                                            MaterialLocalizations
                                                localizations =
                                                MaterialLocalizations.of(
                                                    // ignore: use_build_context_synchronously
                                                    context);
                                            String formattedTime =
                                                localizations.formatTimeOfDay(
                                                    pickedTime!,
                                                    alwaysUse24HourFormat:
                                                        false);
                                  
                                            setState(() {
                                              _endTimeController.text =
                                                  formattedTime;
                                            });
                                          },
                                        ),
                                      ),
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              // _endTimeController.clear();
                              // _startTimeController.clear();
                              // _dayController.clear();
                              // Grade;
                            });
                            if (_formKey.currentState!.validate()) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Scedule Added'),
                              ));
                            }
                          },
                          child: Text(
                            "OK",
                            style: TextStyle(
                                color: Colors.deepPurple, fontSize: 18),
                          )),
                    ],
                  ));
        },
        child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 15, 1, 41),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                Grade,
                style: TextStyle(color: Colors.white),
              ),
            )),
      ),
    );
  }
}
