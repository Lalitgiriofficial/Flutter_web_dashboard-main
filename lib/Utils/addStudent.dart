import 'package:flutter/material.dart';

class AddStudentForm extends StatefulWidget {
  @override
  _AddStudentFormState createState() => _AddStudentFormState();
}

class _AddStudentFormState extends State<AddStudentForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _rollNumber = '';
  String _regNumber = '';
  String _email = '';
  String _course = '';
  String _contactNumber = '';
  String _parentName = '';
  String _parentContactNumber = '';
  String _hostel='';
  String _room='';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.0,
      height: 1500,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add student / Allotment of rooms'),
          backgroundColor: const Color(0xFF5438E1),
          elevation: 0,
        ),
        body: Padding(
          padding:  EdgeInsets.only(top: 15.0),
          child: Container(
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF5438E1),
                  Color(0xFF9C71D7),
                  Color(0xFFE78EDF),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Student Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Name',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _name = value!;
                          },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Roll Number',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a roll number';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _rollNumber = value!;
                          },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Registration Number',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a registration number';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _regNumber = value!;
                          },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter an email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _email = value!;
                          },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Course Name',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a course name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _course = value!;
                          },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Contact Number',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a contact number';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _contactNumber = value!;
                          },
                        ),
                        SizedBox(height: 12,),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Hostel',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a hostel name';
                            }
                            return null;
                          },
                          onSaved: (value) {

                            _hostel = value!;
                          },
                        ),

                        const SizedBox(height: 12.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Block',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty && _hostel=='HR-1') {
                              return 'Please enter a HR-1 Block ';
                            }
                            return null;
                          },
                          onSaved: (value) {

                          },
                        ),


                        const SizedBox(height: 12.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Room Number',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Room number';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _room = value!;
                          },
                        ),

                        const SizedBox(height: 12.0),
                        const Text(
                          'Parent Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Parent Name',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a parent name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _parentName = value!;
                          },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Parent Contact Number',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a parent contact number';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _parentContactNumber = value!;
                          },
                        ),
                        const SizedBox(height: 12.0),
                        const Text(
                          'Mentor Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Mentor Name',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a mentor name';
                            }
                            return null;
                          },
                          onSaved: (value) {

                          },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Mentor Contact number',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a mentor contact number';
                            }
                            return null;
                          },
                          onSaved: (value) {

                          },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Mentor emailId',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a mentor ID';
                            }
                            return null;
                          },
                          onSaved: (value) {

                          },
                        ),
                        const SizedBox(height: 12.0),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onPressed: () {
                              // if (_formKey.currentState!.validate()) {
                              //   _formKey.currentState!.save();
                              //
                              //   // TODO: Add student to database or send data to backend
                              //   Navigator.pop(context);
                              // }
                              setState(() {

                              });
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(20.0),
                                    ),
                                    child: Container(
                                      height: 200,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.check_circle,
                                            size: 50,
                                            color: Colors.green,
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            "Success!",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "Student added successfully",
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 20),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              setState(() {

                                              });
                                            },
                                            child: Text("OK"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                color: Color(0xFF5438E1),
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
