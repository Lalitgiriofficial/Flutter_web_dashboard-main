import 'package:flutter/material.dart';
import 'package:web_dashboard_app_tut/Utils/footer.dart';
import 'package:web_dashboard_app_tut/screens/sendNotification.dart';
import 'package:web_dashboard_app_tut/screens/Students.dart';
import 'package:web_dashboard_app_tut/screens/complaints.dart';
import 'package:web_dashboard_app_tut/screens/dashboard_screen.dart';
import 'package:web_dashboard_app_tut/screens/rooms.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  int selectedIndex = 4;
  final List<DataRow> rows = [
    const DataRow(cells: [
      DataCell(Text('1')),
      DataCell(Text('Purendu Mishra')),
      DataCell(Text('Mess fees')),
      DataCell(Text('Mess fees increased by 1000')),
    ]),
    const DataRow(cells: [
      DataCell(Text('2')),
      DataCell(Text('Purendu Mishra')),
      DataCell(Text('Wifi')),
      DataCell(Text('Campus wifi will not work for 2 days')),
    ]),
    const DataRow(cells: [
      DataCell(Text('3')),
      DataCell(Text('Purendu mishra')),
      DataCell(Text('Lift')),
      DataCell(
          Text('Lift is now functional and can be used between 6am to 11 pm')),
    ]),
    const DataRow(cells: [
      DataCell(Text('4')),
      DataCell(Text('Purnendu mishra')),
      DataCell(Text('Grand Dinner')),
      DataCell(Text(
          'Grand dinner will be provided the coming sunday so you need to collect token from hostel recption.')),
    ]),
    const DataRow(cells: [
      DataCell(Text('3')),
      DataCell(Text('Purnendu mishra')),
      DataCell(Text('Clearance')),
      DataCell(Text(
          'Btech final year students need to take clearance before 10-5-2023')),
    ]),
  ];



  //setting the expansion function for the navigation rail
  bool isExpanded = false;
  final _formKey = GlobalKey<FormState>();
  String from = "";
  String title = "";
  String description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "All Notifications",
                                  style: TextStyle(
                                      color: Color.fromRGBO(45, 70, 151, 1),
                                      fontSize: 28,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w700),
                                ),
                                Row(
                                  children: [
                                    DropdownButton(
                                        hint: const Text("Order By"),
                                        items: const [
                                          DropdownMenuItem(
                                            value: "Oldest",
                                            child: Text("Oldest"),
                                          ),
                                          DropdownMenuItem(
                                            value: "Newest",
                                            child: Text("Newest"),
                                          ),
                                        ],
                                        onChanged: (value) {}),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            Hero(
                              tag: 'Notification',
                              child: SizedBox(
                                height: 300,
                                width: 1200,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      DataTable(
                                        columns: const [
                                          DataColumn(label: Text('Sno')),
                                          DataColumn(label: Text('From')),
                                          DataColumn(label: Text('Subject')),
                                          DataColumn(label: Text('Description')),
                                        ],
                                        rows: rows,
                                        headingRowColor:
                                        MaterialStateColor.resolveWith((states) {
                                          return Colors.grey
                                              .shade200; // change the color to the desired color
                                        }),
                                      ),
                                      //Now let's set the pagination
                                      const SizedBox(
                                        height: 40.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ),
                sendNotification()
              ],
            ),
            FooterWidget()
          ],
        ),
      )

    );
  }
}
