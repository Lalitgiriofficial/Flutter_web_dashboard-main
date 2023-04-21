import 'package:flutter/material.dart';

class addRooms extends StatefulWidget {
  @override
  State<addRooms> createState() => _addRoomsState();
}

class _addRoomsState extends State<addRooms> {
  String selectedOption = "HR-2";
  String selectedBlock='A';
  TextEditingController roomno=new TextEditingController();
  final TextEditingController _studentNameController = TextEditingController();
  List<String> _roommates = [];

  void _addStudent() {
    setState(() {
      String newStudentName = _studentNameController.text;
      if (newStudentName.isNotEmpty) {
        _roommates.add(newStudentName);
        _studentNameController.clear();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: 400,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF5438E1),
                        Color(0xFF9C71D7),
                        Color(0xFFE78EDF),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        'Add Rooms',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                    Row(children: [
                      Text("Hostel:- ",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w200)),
                      const SizedBox(width: 16.0),
                      FormField(
                        builder: (FormFieldState<String> state) {
                          return DropdownButton<String>(
                            dropdownColor: Colors.grey.shade300,
                            value: selectedOption,
                            onChanged: (newValue) {
                              setState(() {
                                selectedOption = newValue.toString();
                              });
                            },
                            items: <String>['HR-1', 'HR-2'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,style: TextStyle(color: Colors.black)),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ],),

                      selectedOption=="HR-1"? Row(
                        children: [
                          Text("Block:- ",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w200)),
                          const SizedBox(width: 20.0),
                          FormField(
                            builder: (FormFieldState<String> state) {
                              return DropdownButton<String>(
                                dropdownColor: Colors.white,
                                value: selectedBlock,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedBlock = newValue.toString();
                                  });
                                },
                                items: <String>['A','B','C','D','E','F'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,style: TextStyle(color: Colors.black),),
                                  );
                                }).toList(),

                              );
                            },
                          )
                        ],
                      ):SizedBox.shrink(),
                       SizedBox(height: 16.0),
                      TextFormField(
                        controller: roomno,
                        decoration: InputDecoration(
                          labelText: 'Room Number',
                          labelStyle: const TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedOption="HR-2";
                            selectedBlock='';
                            roomno.clear();
                            // _titleController.clear();
                            // _fromController.clear();
                            // _descriptionController.clear();
                          });
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  height: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        "Room Added successfully",
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          setState(() {


                                            // _titleController.clear();
                                            // _fromController.clear();
                                            // _descriptionController
                                            //     .clear();
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
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Save',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(47, 50, 121, 1),
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
