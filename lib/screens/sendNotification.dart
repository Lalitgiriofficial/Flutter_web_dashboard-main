import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class sendNotification extends StatefulWidget {


  @override
  State<sendNotification> createState() => _sendNotificationState();
}
class NotificationData {
  String title;
  String body;

  NotificationData({required this.title, required this.body});

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    final data = json['notification'] ?? json;
    return NotificationData(
      title: data['title'],
      body: data['body'],
    );
  }
}
class _sendNotificationState extends State<sendNotification> {
  TextEditingController _fromController = TextEditingController();

  TextEditingController _titleController = TextEditingController();

  TextEditingController _descriptionController = TextEditingController();


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
                           'Send Notification',
                           style: TextStyle(
                             fontSize: 24.0,
                             fontWeight: FontWeight.bold,
                             color: Colors.white,
                           ),
                         ),
                         const SizedBox(height: 16.0),
                         TextFormField(
                           controller: _fromController,
                           decoration: InputDecoration(
                             labelText: 'From',
                             labelStyle:
                             const TextStyle(color: Colors.white),
                             enabledBorder: OutlineInputBorder(
                               borderSide:
                               const BorderSide(color: Colors.white),
                               borderRadius: BorderRadius.circular(8.0),
                             ),
                             focusedBorder: OutlineInputBorder(
                               borderSide:
                               const BorderSide(color: Colors.white),
                               borderRadius: BorderRadius.circular(8.0),
                             ),
                           ),
                           style: const TextStyle(color: Colors.white),
                         ),
                         const SizedBox(height: 16.0),
                         TextFormField(
                           controller: _titleController,
                           decoration: InputDecoration(
                             labelText: 'Title',
                             labelStyle:
                             const TextStyle(color: Colors.white),
                             enabledBorder: OutlineInputBorder(
                               borderSide:
                               const BorderSide(color: Colors.white),
                               borderRadius: BorderRadius.circular(8.0),
                             ),
                             focusedBorder: OutlineInputBorder(
                               borderSide:
                               const BorderSide(color: Colors.white),
                               borderRadius: BorderRadius.circular(8.0),
                             ),
                           ),
                           style: const TextStyle(color: Colors.white),
                         ),
                         const SizedBox(height: 16.0),
                         TextFormField(
                           controller: _descriptionController,
                           decoration: InputDecoration(
                             labelText: 'Description',
                             labelStyle:
                             const TextStyle(color: Colors.white),
                             enabledBorder: OutlineInputBorder(
                               borderSide:
                               const BorderSide(color: Colors.white),
                               borderRadius: BorderRadius.circular(8.0),
                             ),
                             focusedBorder: OutlineInputBorder(
                               borderSide:
                               const BorderSide(color: Colors.white),
                               borderRadius: BorderRadius.circular(8.0),
                             ),
                           ),
                           style: const TextStyle(color: Colors.white),
                           maxLines: 5,
                           maxLength: 500,
                         ),
                         const SizedBox(height: 16.0),
                         ElevatedButton(
                           onPressed: () {
                             setState(() {
                               _titleController.clear();
                               _fromController.clear();
                               _descriptionController.clear();

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
                                           "Notification sent successfully",
                                           textAlign: TextAlign.center,
                                         ),
                                         SizedBox(height: 20),
                                         ElevatedButton(
                                           onPressed: () {
                                             Navigator.of(context).pop();
                                             setState(() {
                                               _titleController.clear();
                                               _fromController.clear();
                                               _descriptionController
                                                   .clear();
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
                               'Submit',
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



