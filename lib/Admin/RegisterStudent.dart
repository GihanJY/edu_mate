import 'package:edu_mate/Admin/AdminHomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Registerstudent extends StatefulWidget {
  const Registerstudent({super.key});

  @override
  State<Registerstudent> createState() => _RegisterstudentState();
}

class _RegisterstudentState extends State<Registerstudent> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _patentNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _maths = false;
  bool _science = false;
  bool _english = false;
  bool _history = false;
  bool _sinhala = false;
  bool _commerce = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
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
                children: [
                  Image(
                    image: AssetImage("assets/images/AppLogo.png"),
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    "REGISTER STUDENT",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Your Name";
                                }
                                return null;
                              },
                              controller: _nameController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 13, 0, 253),
                                  ),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 36, 36, 63),
                                labelText: "Full Name",
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Your Date of Birth";
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.white),
                              controller: _dateController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 13, 0, 253),
                                  ),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 36, 36, 63),
                                labelText: "Date Of Birth",
                                labelStyle: TextStyle(color: Colors.white),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    showDatePicker(
                                            context: context,
                                            firstDate: DateTime(2004),
                                            lastDate: DateTime.now())
                                        .then((value) {
                                      setState(() {
                                        _dateController.text =
                                            DateFormat('dd/MM/yyyy')
                                                .format(value!);
                                      });
                                    });
                                  },
                                  color: Colors.white,
                                  icon: Icon(Icons.calendar_month),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: DropdownButtonFormField<String>(
                              validator: (value) {
                                if (value == null) {
                                  return "Please Enter Your Gender";
                                }
                                return null;
                              },
                              value: null,
                              items: ['Male', 'Female']
                                  .map((String value) =>
                                      DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _genderController.text = value!;
                                });
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 13, 0, 253),
                                  ),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 36, 36, 63),
                                labelText: "Gender",
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              dropdownColor:
                                  const Color.fromARGB(255, 36, 36, 63),
                              borderRadius: BorderRadius.circular(10),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: DropdownButtonFormField<String>(
                              validator: (value) {
                                if (value == null) {
                                  return "Please Enter Your Grade";
                                }
                                return null;
                              },
                              value: null,
                              items: [
                                'Grade6',
                                'Grade7',
                                'Grade8',
                                'Grade9',
                                'Grade10',
                                'Grade11'
                              ]
                                  .map((String value) =>
                                      DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _gradeController.text = value!;
                                });
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 13, 0, 253),
                                  ),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 36, 36, 63),
                                labelText: "Grades",
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              dropdownColor:
                                  const Color.fromARGB(255, 36, 36, 63),
                              borderRadius: BorderRadius.circular(10),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, top: 15),
                                child: Text(
                                  "Subjects",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      tileColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      title: Text(
                                        "Maths",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      value: _maths,
                                      activeColor:
                                          Color.fromARGB(255, 13, 0, 253),
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Color.fromARGB(255, 0, 0, 0))),
                                      onChanged: (value) {
                                        setState(() {
                                          _maths = value!;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text(
                                        "Science",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      value: _science,
                                      onChanged: (value) {
                                        setState(() {
                                          _science = value!;
                                        });
                                      },
                                      activeColor:
                                          Color.fromARGB(255, 13, 0, 253),
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255))),
                                    ),
                                    CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text(
                                        "English",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      value: _english,
                                      onChanged: (value) {
                                        setState(() {
                                          _english = value!;
                                        });
                                      },
                                      activeColor:
                                          Color.fromARGB(255, 13, 0, 253),
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Color.fromARGB(255, 0, 0, 0))),
                                    ),
                                    CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text(
                                        "History",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      value: _history,
                                      onChanged: (value) {
                                        setState(() {
                                          _history = value!;
                                        });
                                      },
                                      activeColor:
                                          Color.fromARGB(255, 13, 0, 253),
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Color.fromARGB(255, 0, 0, 0))),
                                    ),
                                    CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text(
                                        "Sinhala",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      value: _sinhala,
                                      onChanged: (value) {
                                        setState(() {
                                          _sinhala = value!;
                                        });
                                      },
                                      activeColor:
                                          Color.fromARGB(255, 13, 0, 253),
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Color.fromARGB(255, 0, 0, 0))),
                                    ),
                                    CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text(
                                        "Commerce",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      value: _commerce,
                                      onChanged: (value) {
                                        setState(() {
                                          _commerce = value!;
                                        });
                                      },
                                      activeColor:
                                          Color.fromARGB(255, 13, 0, 253),
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Color.fromARGB(255, 0, 0, 0))),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Contact Number";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.phone,
                              controller: _phoneController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 13, 0, 253),
                                  ),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 36, 36, 63),
                                labelText: "Contact No.",
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Parent's Contact Number";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.phone,
                              controller: _patentNoController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 13, 0, 253),
                                  ),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 36, 36, 63),
                                labelText: "Parent's Contact No.",
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Email";
                                }
                                if (!value.contains("@gmail.com")) {
                                  return "Please Enter Valid Email";
                                }
                                return null;
                              },
                              controller: _emailController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 13, 0, 253),
                                  ),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 36, 36, 63),
                                labelText: "Email",
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: GestureDetector(
                              onTap: () {
                                _formKey.currentState!.save();

                                List<String> Subjects = [];
                                if (_formKey.currentState!.validate()) {
                                  if (_maths) {
                                    Subjects.add("Maths");
                                  }
                                  if (_science) {
                                    Subjects.add("Science");
                                  }
                                  if (_english) {
                                    Subjects.add('English');
                                  }
                                  if (_history) {
                                    Subjects.add("History");
                                  }
                                  if (_sinhala) {
                                    Subjects.add("Sinhala");
                                  }
                                  if (_commerce) {
                                    Subjects.add("Commerce");
                                  }
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Adminhomepage()));
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromARGB(255, 68, 51, 180),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: BorderSide.strokeAlignCenter,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    )
                                  ],
                                ),
                                height: 50,
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    "Submit",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
